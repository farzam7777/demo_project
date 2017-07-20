class Movie < ActiveRecord::Base
  has_many :appearences, dependent: :destroy
  has_many :actors, through: :appearences
  has_many :posters, dependent: :destroy
  
  accepts_nested_attributes_for :appearences, :allow_destroy => true
  accepts_nested_attributes_for :posters, :allow_destroy => true 
end
