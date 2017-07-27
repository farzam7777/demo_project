class Admin::ReviewsController < Admin::BaseController
  before_filter :find_review, only: [:destroy, :review_stay]
  
  def index
    @reviews = Review.reported_reviews.page(params[:page]).per(2)
  end
  
  def destroy
    respond_to do |format|
      if @review.destroy
        format.html{ redirect_to admin_reviews_path, notice: "Review is Successfully Deleted." }
        format.js
      else
        format.html{ redirect_to admin_reviews_path, notice: "Some Problem Occured while deleting Review." }
        format.js
      end
    end
  end
  
  def review_stay
    respond_to do |format|
      if @review.reports.delete_all
        format.html{ redirect_to admin_reviews_path, notice: "Review is Successfully marked Valid." }
        format.js
      else
        format.html{ redirect_to admin_reviews_path, notice: "Some Problem Occured while validating Review." }
        format.js
      end
    end
  end
  
  private
    
    def find_review
      @review = Review.find(params[:id])
    end
end
