class MoonwalkAPI
  API_TOKEN = ENV['MOONWALK_API_TOKEN']
  BASE_URL = 'http://moonwalk.cc/api'.freeze

  def serials
    get('/serials_anime.json')['report']['serials']
  end

  def updates_serials
    get('/serials_updates.json')['updates']
  end

  def movies
    get('/movies_anime.json')['report']['serials']
  end

  def updates_movies
    get('/movies_updates.json')['updates']
  end

  private

  # Выполняет GET запрос к MoonWalk и возвращяет json
  def get(path)
    # todo: переделать
    response = http.get("#{path}?api_token=#{API_TOKEN}&category=Anime") do |req|
      req.headers['Accept'] = 'application/json'
    end

    raise NotFound if response.status == 404
    raise 'MoonWalk Error' unless response.success?

    JSON.parse(response.body)
  end
end
