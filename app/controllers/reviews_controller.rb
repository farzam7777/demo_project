class ReviewsController < ApplicationController
  before_filter :find_movie, only: [:create]
  
  def create
    @review = @movie.reviews.build(review_params)
    
    if @review.save
      redirect_to movie_path(@movie), notice: "Review is successfully submitted."
    else
      redirect_to movie_path(@movie), notice: "Review is not successfully submitted."
    end
  end
  
  def edit
    
  end
  
  def update
    
  end
  
  def destroy
    
  end
  
  def review_params
    params.require(:review).permit(:movie_id, :user_id, :content)
  end
  
  private
    
    def find_movie
      @movie = Movie.find(params[:movie_id])
    end
end
