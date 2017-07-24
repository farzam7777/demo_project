class MoviesController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :edit, :create, :destroy, :update]
  
  def index
    listing_type = params[:listing_type]
    @listing = listing_type.split('_')[0]
    @movies = Movie.get_typed_movies(@listing)
  end

  def show
    @movie = Movie.includes(:posters, :actors).find(params[:id])
  end
end
