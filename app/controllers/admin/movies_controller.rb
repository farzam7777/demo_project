class Admin::MoviesController < Admin::BaseController
  before_filter :find_movie, only: [:edit, :update, :destroy, :mark_feature, :mark_unfeature]
  
  def index
    @movies = Movie.all.page(params[:page]).per(2)
  end

  def new
    @movie = Movie.new
  end
  
  def create
    @movie = Movie.new(movie_params)
    
    if @movie.save
      redirect_to admin_root_path, notice: "New Movie Successfully Created."
    else
      render :new
    end
    
    rescue ActiveRecord::RecordNotUnique 
      flash[:notice] = 'Unable to create Movie with same Actors' 
      render :new 
  end

  def edit
    @actors = Actor.all
  end
  
  def update
    @movie.update_attributes(movie_params)
    
    if @movie.save
      redirect_to @movie, notice: "Movie is Successfully Updated."
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
      redirect_to [:admin, @movie], notice: "Some Problem Occured while deleting Movie."
    end
  end
  
  def mark_feature
    @movie.featured = true;
    
    respond_to do |format|
      if @movie.save
        format.html { redirect_to admin_root_path, notice: "Movie is Successfully Marked Featured." }
        format.js
      else
        format.html { redirect_to admin_root_path, notice: "Some Problem Occured while marking movie as Featured." }
        format.js
      end
    end
  end
  
  def mark_unfeature
    @movie.featured = false;
    
    respond_to do |format|
      if @movie.save
        format.html { redirect_to admin_root_path, notice: "Movie is Successfully Marked Un-Featured." }
        format.js
      else
        format.html { redirect_to admin_root_path, notice: "Some Problem Occured while marking movie as Un-Featured." }
        format.js
      end
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
