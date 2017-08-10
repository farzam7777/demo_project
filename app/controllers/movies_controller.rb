class MoviesController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :edit, :create, :destroy, :update]
  before_filter :find_movie, only: [:mark_favorite, :mark_unfavorite]
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
  
  def mark_favorite
    @favorite = Favorite.create(movie_id: @movie.id, user_id: current_user.id)
    
    respond_to do |format|
      if @favorite.save
        format.html { redirect_to @movie, notice: 'Movie is successfully marked favorite by you.' }
        format.js
      else
        format.html { redirect_to @movie, notice: 'Some Problem Ocurred.' }
        format.js
      end
    end
  end
  
  def mark_unfavorite
    @favorite = Favorite.where(movie_id: @movie.id, user_id: current_user.id)
    
    respond_to do |format|
      if @favorite.destroy(@favorite)
       format.html { redirect_to @movie, notice: 'Movie is successfully marked un-favorite by you.' }
       format.js
      else
        format.html { redirect_to @movie, notice: 'Some Problem Ocurred.' }
        format.js
      end
    end
  end
  
  # def search
  #   @movies = Movie.search(params[:search], order: :title).page(params[:page]).per(3)
  # end
  
  private
  
    def find_movie
      @movie = Movie.find(params[:id])
    end
end
