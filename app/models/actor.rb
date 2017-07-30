class Actor < ActiveRecord::Base
  has_many :appearences
  has_many :movies, through: :appearences
  
  validates :name, presence: true
  validates :description, length: { minimum: 15 }
end
