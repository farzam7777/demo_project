class ReviewsController < ApplicationController
  before_filter :find_movie, only: [:create, :update, :edit, :destroy]
  before_filter :find_review, only: [:edit, :update, :destroy]
  
  def create
    @review = @movie.reviews.new(review_params)
    @users = @movie.favorites.map(&:user)
    respond_to do |format|
      if @review.save
        @users.each do |user|
          UserMailer.delay.favorited_users(user, @movie, current_user) unless user == current_user 
        end
        format.html{ redirect_to @movie, notice: "Review is successfully submitted." }
        format.js
      else
        format.html{ redirect_to @movie, notice: "Review is not successfully submitted." }
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
      redirect_to @movie, notice: "Review is successfully updated."
    else
      redirect_to @movie, notice: "Some problem occured while updating."
    end
  end
  
  def destroy
    authorize! :destroy, @review
    respond_to do |format|
      if @review.destroy
        format.html{ redirect_to @movie, notice: "Review is Successfully Deleted." }
        format.js
      else
        format.html{ redirect_to @movie, notice: "Some Problem Occured while deleting Review." }
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
