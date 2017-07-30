class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,:confirmable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_attached_file :image, styles: 
  { medium: "300x300>", thumb: "100x100#" }, 
  default_url: ActionController::Base.helpers.asset_path("missing.jpg")
  
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  
  ratyrate_rater
  
  has_many :reviews, dependent: :destroy
  has_many :reports
  has_many :favorites, dependent: :destroy
  
  validates :username, presence: true
  validates :gender, presence: true
  
  scope :find_with_favorites, -> { includes(:favorites) }
end
