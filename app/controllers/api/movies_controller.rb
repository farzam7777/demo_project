class Api::MoviesController < Api::BaseController
  
  def index
    @movies = Movie.includes(:actors, :posters, :reviews, :movie_average)
    render json: @movies
  end

  def show
    @movie = Movie.all_associations.find(params[:id])
    @actors = @movie.actors
    @reviews = @movie.reviews
    @posters = @movie.posters
    @review = Review.new
    render json: @movie
  end
  
  def search
    @movies = Movie.search(params[:search], order: :title).page(params[:page]).per(3)
    render json: @movies
  end
  
  private
  
    def find_movie
      @movie = Movie.find(params[:id])
    end
end
