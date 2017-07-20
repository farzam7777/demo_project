class MoviesController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :edit, :create, :destroy, :update]
  before_filter :authenticate_admin, only: [:new, :edit, :create, :destroy, :update]
  
  def index
    @movies = Movie.all
  end

  def new
  end

  def edit
  end

  def show
    @movie = Movie.find(params[:id])
  end
  
  private
    
    def authenticate_admin
      authorize! :manage, Movie
    end
end
