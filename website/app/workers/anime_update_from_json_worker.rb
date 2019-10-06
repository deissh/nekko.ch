require 'json'
require 'open-uri'

class AnimeUpdateFromJsonWorker
  include Sidekiq::Worker

  def perform(data) # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
    data = JSON.parse(data)

    # получаем аниме по его названию, если его нет то создаем новый тайтл
    anime = Anime.find_by(title: data['title']) rescue nil # rubocop:disable Style/RescueModifier
    if anime.nil?
      anime = Anime.create!(title: data['title'],
                            title_en: data['title_en'],
                            title_or: data['title_or'],
                            annotation: data['annotation'],
                            description: data['description'],
                            status: data['status'],
                            year: data['year'],
                            blocked_ru: data['blocked_ru'],
                            blocked_ua: data['blocked_ua'],
                            world_art_id: data['world_art_id'] || '',
                            kinopoisk_id: data['kinopoisk_id'] || '',
                            countries: data['countries'],
                            actors: data['actors'],
                            directors: data['directors'],
                            studios: data['studios'],
                            rating: (data['rating'] || 5).round,
                            hide: false)

      if data['genres']
        anime.genres << Genre.where('name ILIKE ANY ( array[?] )', data['genres']) rescue [] # rubocop:disable Style/RescueModifier
      end

      logger.info "Created #{anime.title_en}"
    end

    # Обновление постера если его нету
    if (anime.poster_url.nil? || anime.poster_url == Rails.configuration.cdn_fallbackUrl) && !data['poster'].nil? # rubocop:disable Metrics/LineLength
      begin
        open(data['poster']) do |u| # rubocop:disable Security/Open
          logger.info 'Saving ' + data['poster']
          anime.poster.attach(io: u, filename: 'poster.jpg')
        end
      rescue StandardError => e
        logger.error e.message
        anime.skip_callback(true)
        anime.poster_url = data['poster']
      end
    end

    data['translators'].each do |tr|
      translator = anime.translators.find_by(name: tr['name']) rescue nil # rubocop:disable Style/RescueModifier
      if translator.nil?
        logger.info "New translator #{tr['name']} in #{anime.title_en}"
        translator = AnimeTranslator.create!(name: tr['name'],
                                             translator_id: tr['id'],
                                             anime: anime)
      end

      ep_count = translator.episodes.count
      new_ep_count = tr['episodes'].length

      next unless new_ep_count != ep_count
      new_eps = tr['episodes'].last(new_ep_count - ep_count) rescue [] # rubocop:disable Style/RescueModifier
      new_eps.each_with_index do |stream_url, idx|
        Episode.create!(name: idx.to_s,
                        stream_url: stream_url,
                        anime_translator: translator)
      end
    end

    # сохраняем все изменения
    anime.save! if anime.changed?
  end
end
