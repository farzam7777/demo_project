class Admin::MoviesController < Admin::BaseController
  before_filter :find_movie, only: [:edit, :update, :destroy]
  
  def index
    @movies = Movie.includes(:posters).all
  end

  def new
    @movie = Movie.new
    @actors = Actor.all
  end
  
  def create
    @movie = Movie.create(movie_params)
    
    if @movie.save
      redirect_to admin_root_path, notice: "New Movie Successfully Created."
    else
      render :new
    end
  end

  def edit
    @actors = Actor.all
  end
  
  def update
    @movie.update_attributes(movie_params)
    
    if @movie.save
      redirect_to admin_movie_path(@movie), notice: "Movie is Successfully Updated."
    else
      render :edit
    end
  end

  def show
    @movie = Movie.includes(:posters, :actors).find(params[:id])
  end
  
  def destroy
    if @movie.destroy
      redirect_to admin_root_path, notice: "Movie is Successfully Deleted."
    else
      redirect_to admin_movie_path(@movie), notice: "Some Problem Occured while deleting Movie."
    end
  end
  
  private
  
    def movie_params
      params.require(:movie).permit(:title, :description, :year, :trailor, appearences_attributes: [:id, :movie_id, :actor_id, :_destroy], posters_attributes: [:id, :image, :_destroy])
    end
    
    def find_movie
      @movie = Movie.find(params[:id])
    end
end
