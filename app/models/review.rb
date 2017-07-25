class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :movie
  
  def username
    user.username.capitalize
  end
end
