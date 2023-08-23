class Movies
  attr_reader :title,
              :rating

  def initialize(data)
    @title = data['title']
    @rating = data['vote_average']
  end
end