class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :movie
  has_many :reports, dependent: :destroy
  
  def username
    user.username.capitalize
  end
  
  def get_comma(review, reported_user)
    "," unless reported_user == review.reports.last
  end
  
  def self.reported_reviews
    joins(:reports).includes(:movie, {reports: :user}).distinct
  end
end
