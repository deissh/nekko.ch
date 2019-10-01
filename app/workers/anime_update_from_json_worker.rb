require 'json'
require 'open-uri'

class AnimeUpdateFromJsonWorker
  include Sidekiq::Worker

  def perform(data) # rubocop:disable Metrics/AbcSize
    data = JSON.parse(data)

    # получаем аниме по его названию, если его нет то создаем новый тайтл
    anime = Anime.find(title_en: data['title_en']) rescue nil # rubocop:disable Style/RescueModifier
    if anime.nil?
      logger.info "Creating #{data['title']}"
      anime_media = Media.create!(nsfw: false,
                                  media_type: 0,
                                  rating: (data['rating'] || 5).round)
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
                            hide: false, media: anime_media)
    end

    # Обновление постера если его нету
    unless anime.poster.attached? && data['poster'].nil?
      begin
        u = open(data['poster']) # rubocop:disable Security/Open
        anime.poster.attach(io: u, filename: 'poster.jpg')
      rescue StandardError
        logger.error 'Uploading new image'
      end
    end

    data['translators'].each do |tr|
      translator = anime.translators.find(name: tr['name']) rescue nil # rubocop:disable Style/RescueModifier
      if translator.nil?
        translator = AnimeTranslator.create!(name: tr['name'],
                                             translator_id: tr['id'],
                                             anime: anime)
      end

      ep_count = translator.episodes.count
      new_ep_count = tr['episodes'].length
      last_ep = translator.episodes.all.last

      next unless new_ep_count != ep_count
      new_eps = tr['episodes'].last(new_ep_count - ep_count)
      new_eps.each_with_index do |stream_url, idx|
        Episode.create!(name: idx.to_s,
                        stream_url: stream_url,
                        anime_translator: translator)
      end
    end

    # сохраняем все изменения
    anime.save!
  end
end
