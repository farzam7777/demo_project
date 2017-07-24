class Movie < ActiveRecord::Base
  has_many :appearences, dependent: :destroy
  has_many :actors, through: :appearences
  has_many :posters, dependent: :destroy
  
  accepts_nested_attributes_for :appearences, :allow_destroy => true
  accepts_nested_attributes_for :posters, :allow_destroy => true 

  def display_first_poster
    posters.first.image.url(:medium)
  end
  
  def self.latest_movies
    includes(:posters).order('created_at desc').limit(3)
  end
end
