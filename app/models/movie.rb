class Movie < ActiveRecord::Base
  has_many :appearences, dependent: :destroy
  has_many :actors, through: :appearences
  has_many :posters, dependent: :destroy
  
  accepts_nested_attributes_for :appearences, :allow_destroy => true
  accepts_nested_attributes_for :posters, :allow_destroy => true 

  def display_first_poster
    posters.first.image.url(:medium)
  end
  
  def self.limited_latest_movies
    includes(:posters).order('created_at desc').limit(3)
  end
  
  def self.limited_featured_movies
    includes(:posters).all.where("featured = ?", true).limit(3)
  end
  
  def self.featured_movies
    includes(:posters).all.where("featured = ?", true)
  end
  
  def self.get_typed_movies(type)
    if type == "latest"
      @movies = Movie.includes(:posters).all
    elsif type == "featured"
      @movies = Movie.featured_movies
    end
  end
end
