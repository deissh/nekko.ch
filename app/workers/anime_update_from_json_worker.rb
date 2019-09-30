require 'json'
require 'open-uri'

class AnimeUpdateFromJsonWorker
  include Sidekiq::Worker

  def perform(data) # rubocop:disable Metrics/AbcSize
    data = JSON.parse(data)

    anime = Anime.find(title: data['title']) rescue nil # rubocop:disable Style/RescueModifier
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
      u = open(data['poster']) # rubocop:disable Security/Open
      anime.poster.attach(io: u, filename: 'poster.jpg')
    end
    anime.save!
  end
end
