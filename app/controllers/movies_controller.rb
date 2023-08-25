# frozen_string_literal: true

class MoviesController < ApplicationController
  def discover
    @user = User.find(params[:user_id])
  end

  def index
    @user = User.find(params[:user_id])
    @facade = MoviesFacade.new(params[:q], params[:keywords])
  end

  def show
    @user = User.find(params[:user_id])
    @facade = MoviesFacade.new(params[:id], nil).movie_details
  end
end
