class Movie < ActiveRecord::Base
  has_many :appearences, dependent: :destroy
  has_many :actors, through: :appearences
  has_many :posters, dependent: :destroy
  has_many :reviews, dependent: :destroy
  
  accepts_nested_attributes_for :appearences, :allow_destroy => true
  accepts_nested_attributes_for :posters, :allow_destroy => true
  
  ratyrate_rateable 'movie'

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
  
  def self.limited_top_movies
    joins("Inner JOIN rating_caches ON movies.id = cacheable_id").order('rating_caches.avg desc').limit(3)
  end
  
  def self.top_movies
    joins("Inner JOIN rating_caches ON movies.id = cacheable_id").where('rating_caches.avg >= ?', 3).order('rating_caches.avg desc')
  end
  
  def self.get_typed_movies(type)
    if type == "latest"
      @movies = Movie.includes(:posters).all
    elsif type == "featured"
      @movies = Movie.featured_movies
    elsif type == "top"
      @movies = Movie.top_movies
    end
  end
end
