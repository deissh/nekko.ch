class MoonwalkUpdateAllWorker
  include Sidekiq::Worker

  def perform
    data = JSON.parse(
      Faraday.get((ENV['MOONWALK_PARSER_URL'] || 'http://localhost:8080') + '/updates').body
    )

    logger.info "Total parsed: #{data.length}"

    data.each do |anime|
      AnimeUpdateFromJsonWorker.perform_async(anime.to_json)
    end
  end
end
