class MoviesController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :edit, :create, :destroy, :update]
  
  def index
    @movies = Movie.includes(:posters).all
  end

  def show
    @movie = Movie.includes(:posters, :actors).find(params[:id])
  end
end
