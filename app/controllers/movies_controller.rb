class MoviesController < ApplicationController
  def discover
    @user = User.find(params[:user_id])
  end

  def results
    if params[:search_type == "top_rated"]
      @facade = MoviesFacade.top_20_rated_movies
    else
      @facade = MoviesFacade.new(params[:keywords])
    end
  end
end