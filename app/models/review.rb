class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :movie
  has_many :reports, dependent: :destroy
  
  scope :reported_reviews, -> { joins(:reports).includes(:movie, {reports: :user}).distinct }
  
  def username
    user.username.capitalize
  end
  
  def get_comma(review, reported_user)
    "," unless reported_user == review.reports.last
  end
end
