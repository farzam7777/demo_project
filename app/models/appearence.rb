class Appearence < ActiveRecord::Base
  belongs_to :actor
  belongs_to :movie
  
  validates_uniqueness_of :actor_id, scope: :movie_id
  
  after_save :update_delta
  after_destroy :update_delta
  
  def update_delta
    movie.delta = true
    movie.save
  end
end
