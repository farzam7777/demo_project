class ReviewsController < ApplicationController
  before_filter :find_movie, only: [:create, :update, :edit, :destroy]
  before_filter :find_review, only: [:edit, :update, :destroy]
  
  def create
    @review = @movie.reviews.build(review_params)
    
    respond_to do |format|
      if @review.save
        format.html{ redirect_to movie_path(@movie), notice: "Review is successfully submitted." }
        format.js
      else
        format.html{ redirect_to movie_path(@movie), notice: "Review is not successfully submitted." }
        format.js
      end
    end
  end
  
  def edit
    authorize! :update, @review
  end
  
  def update
    authorize! :update, @review
    @review.update_attributes(review_params)
    
    if @review.save
      redirect_to movie_path(@movie), notice: "Review is successfully updated."
    else
      redirect_to movie_path(@movie), notice: "Some problem occured while updating."
    end
  end
  
  def destroy
    authorize! :update, @review
    respond_to do |format|
      if @review.destroy
        format.html{ redirect_to movie_path(@movie), notice: "Review is Successfully Deleted." }
        format.js
      else
        format.html{ redirect_to movie_path(@movie), notice: "Some Problem Occured while deleting Review." }
        format.js
      end
    end
  end
  
  def review_params
    params.require(:review).permit(:movie_id, :user_id, :content)
  end
  
  private
    
    def find_movie
      @movie = Movie.find(params[:movie_id])
    end
    
    def find_review
      @review = Review.find(params[:id])
    end
end
