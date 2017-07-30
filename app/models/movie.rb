class Movie < ActiveRecord::Base
  has_many :appearences, dependent: :destroy
  has_many :actors, through: :appearences
  has_many :posters, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  accepts_nested_attributes_for :appearences, :allow_destroy => true
  accepts_nested_attributes_for :posters, :allow_destroy => true
  
  ratyrate_rateable 'movie'

  scope :limited_latest_movies, -> { includes(:posters).where(year: Time.current.year).limit(3) }
  scope :latest_movies, -> { includes(:posters).where(year: Time.current.year).all }
  scope :limited_featured_movies, -> { includes(:posters).all.where("featured = ?", true).limit(3) }
  scope :featured_movies, -> { includes(:posters).all.where("featured = ?", true) }
  
  scope :limited_top_movies, -> { 
    joins(:movie_average)
    .where("rating_caches.avg >= ?", 3)
    .order('rating_caches.avg desc')
    .limit(3) 
  }
  
  scope :top_movies, -> { 
    joins(:movie_average)
    .where("rating_caches.avg >= ?", 3)
    .order('rating_caches.avg desc') 
  }
  
  scope :all_associations, -> { includes(:posters, :actors, :reviews) }
  
  validates :title, presence: true
  validates :description, length: { minimum: 15 }
  validates :year, presence: true
  validates :trailor, presence: true
  validate :require_one_poster
  validate :require_two_actors
    
  def require_one_poster
    errors.add(:base, "You must provide at least one poster") if posters(&:marked_for_destruction?).size < 1
  end
  
  def require_two_actors
    errors.add(:base, "You must assign at least two actors") if appearences(&:marked_for_destruction?).size < 2
  end
  
  def display_first_poster
    posters.first.image.url(:medium)
  end
  
  def self.get_typed_movies(type)
    if type == "latest"
      @movies = Movie.latest_movies
    elsif type == "featured"
      @movies = Movie.featured_movies
    elsif type == "top"
      @movies = Movie.top_movies
    end
  end
end
