class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :movie
  has_many :reports
  
  def username
    user.username.capitalize
  end
end
