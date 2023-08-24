class MoviesController < ApplicationController
  def discover
    @user = User.find(params[:user_id])
  end

  def index
    @user = User.find(params[:user_id])
    @facade = MoviesFacade.new(params[:q])
  end
end