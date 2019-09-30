require 'json'

class AnimeUpdateFromJsonWorker
  include Sidekiq::Worker

  # @param [String] anime json object
  def perform(data)
    data = JSON.parse(data)

    anime = Anime.find(title: data['title']) rescue nil
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
                            world_art_id: data['world_art_id'] || "",
                            kinopoisk_id: data['kinopoisk_id'] || "",
                            countries: data['countries'],
                            actors: data['actors'],
                            directors: data['directors'],
                            studios: data['studios'],
                            hide: true, media: anime_media)
    end
  end
end
