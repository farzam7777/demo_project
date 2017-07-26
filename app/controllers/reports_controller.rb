class ReportsController < ApplicationController
  def create
    @review = params[:review]
    user_id = params[:user_id]
    @report = Report.create(review_id: @review, user_id: user_id)
    
    respond_to do |format|
      if @report.save
        format.html { redirect_to root_path, notice: 'Report Done' }
        @message = "Review is successfuly marked reported by you."
        format.js
      else
        format.html { redirect_to root_path, notice: 'Report not Done' }
        @message = "You already have reported this review."
        format.js
      end
    end
  end
end
