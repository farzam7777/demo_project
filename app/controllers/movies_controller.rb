class MoviesController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :edit, :create, :destroy, :update]
  before_filter :authenticate_admin, only: [:new, :edit, :create, :destroy, :update]
  
  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
    @actors = Actor.all
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
    @movie = Movie.find(params[:id])
    @actors = Actor.all
  end
  
  def update
    @movie = Movie.find(params[:id])
    
    if @movie.update_attributes(movie_params)
      redirect_to movie_path(@movie), notice: "Movie is successfully updated. "
    else
      render :edit
    end
  end

  def show
    @movie = Movie.find(params[:id])
  end
  
  def destroy
    @movie = Movie.find(params[:id])
    
    if @movie.destroy
      redirect_to movies_path, notice: "Movie is successfully Deleted. "
    else
      redirect_to movie_path(@movie), notice: "Some problem occured while deleting movie. "
    end
  end
  
  private
  
    def movie_params
      params.require(:movie).permit(:title, :description, :year, :trailor, appearences_attributes: [:id, :movie_id, :actor_id, :_destroy])
    end
    
    def authenticate_admin
      authorize! :manage, Movie
    end
end
