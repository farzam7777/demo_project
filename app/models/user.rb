class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,:confirmable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100#" }, :default_url => ActionController::Base.helpers.asset_path("missing.jpg")
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
