class MoviesFacade
  def initialize(keywords)
    @keywords = keywords
  end

  def self.top_20_rated_movies
    MoviesService.top_20_rated_search
  end

  def keyword_results
    MoviesService.keyword_search(@keywords)
  end
end