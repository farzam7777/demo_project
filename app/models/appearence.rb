class Appearence < ActiveRecord::Base
  belongs_to :actor
  belongs_to :movie
  
  validates_uniqueness_of :actor_id, scope: :movie_id
end
