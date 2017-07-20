class MoviesController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :edit, :create, :destroy, :update]
  before_filter :authenticate_admin, only: [:new, :edit, :create, :destroy, :update]
  
  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end
  
  def create
    @movie = Movie.create(movie_params)
    
    if @movie.save
      redirect_to movie_path(@movie), notice: "Movie is successfully created. "
    else
      render :new
    end
  end

  def edit
  end

  def show
    @movie = Movie.find(params[:id])
  end
  
  private
  
    def movie_params
      params.require(:movie).permit(:title, :description, :year, :trailor)
    end
    
    def authenticate_admin
      authorize! :manage, Movie
    end
end
