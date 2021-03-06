class Poster < ActiveRecord::Base
  has_attached_file :image, styles: 
  { large: "600x600>", medium: "300x300>", thumb: "100x100>" }, 
  default_url: ActionController::Base.helpers.asset_path("missing.jpg")
  
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  
  belongs_to :movie 
end
