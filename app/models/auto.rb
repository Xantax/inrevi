class Auto < ActiveRecord::Base
  
  validates :name, presence: true
  validates :additionalinfo, presence: true
  validates :image, presence: true
#  validates :remote_image_url, presence: true
  
  has_many :auto_reviews
  
  mount_uploader :image, ImageUploader
  
  searchable do
    text :name, :boost => 10
    text :additionalinfo
  end
  
end
