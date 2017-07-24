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
  
  def self.featured_movies
    includes(:posters).all.where("featured = ?", true).limit(3)
  end
  
  def self.all_featured_movies
    includes(:posters).all.where("featured = ?", true)
  end
  
  def self.typed_movies(listing_type)
    if listing_type == "latest_movies"
      @movies = Movie.includes(:posters).all
    elsif listing_type == "featured_movies"
      @movies = Movie.all_featured_movies
    end
  end
end
