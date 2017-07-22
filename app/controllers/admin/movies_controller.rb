class Admin::MoviesController < Admin::BaseController
  before_filter :find_movie, only: [:edit, :update, :destroy]
  
  def index
  end

  def new
    @movie = Movie.new
    @actors = Actor.all
  end
  
  def create
  end

  def edit
    @actors = Actor.all
  end
  
  def update
  end

  def show
    @movie = Movie.includes(:posters, :actors).find(params[:id])
  end
  
  def destroy
  end
  
  private
  
    def movie_params
      params.require(:movie).permit(:title, :description, :year, :trailor, appearences_attributes: [:id, :movie_id, :actor_id, :_destroy], posters_attributes: [:id, :image, :_destroy])
    end
    
    def find_movie
      @movie = Movie.find(params[:id])
    end
end
