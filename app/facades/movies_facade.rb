class MoviesFacade
  attr_reader :search

  def initialize(search)
    @search = search
  end

  def movie_results
    if @search == "top_rated"
      top_rated
    else
      keyword_results
    end
  end

  def top_rated
    service = MoviesService.new

    json = service.top_20_rated

    json[:results].first(20).map do |movie_data|
      Movie.new(movie_data)
    end
  end

  def keyword_results
    service = MoviesService.new

    json = service.keyword_search(@search)

    json[:results].first(20).map do |movie_data|
      Movie.new(movie_data)
    end
  end
end