class MoviesController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :edit, :create, :destroy, :update]
  
  def index
    listing_type = params[:listing_type]
    @listing = listing_type.split('_')[0]
    @movies = Movie.get_typed_movies(@listing).page(params[:page]).per(3)
  end

  def show
    @movie = Movie.all_associations.find(params[:id])
    @actors = @movie.actors
    @reviews = @movie.reviews
    @posters = @movie.posters
    @review = Review.new
  end
end
