class Movie < ActiveRecord::Base
  has_many :appearences, dependent: :destroy
  has_many :actors, through: :appearences
  accepts_nested_attributes_for :appearences, :allow_destroy => true
end
