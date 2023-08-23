class MoviesController < ApplicationController
  def discover
    @user = User.find(params[:user_id])
  end

  def search

  end
end