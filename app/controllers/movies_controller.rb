class MoviesController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :edit, :create, :destroy, :update]
  
  def index
    listing_type = params[:listing_type]
    
    if listing_type == "latest_movies"
      @movies = Movie.includes(:posters).all
    end
  end

  def show
    @movie = Movie.includes(:posters, :actors).find(params[:id])
  end
end
