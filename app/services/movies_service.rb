class MoviesService
  def keyword_search(keyword)
    get_url("search/movie?query=#{keyword}&page=1")
  end

  def top_20_search
    get_url("movie/top_rated?language=en-US&with_original_language=en")
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://api.themoviedb.org/3/") do |faraday|
      faraday.headers["accept"] = 'application/json'
      faraday.headers["Authorization"] = "Bearer #{ENV["TMDB_API_KEY"]}"
    end
  end
end