class Auto < ActiveRecord::Base
  
  validates :name, presence: true
  validates :engine, presence: true
  validates :transmission, presence: true
  validates :horsepower, presence: true
  validates :fueleconomy, presence: true
  validates :navigation, presence: true
  validates :bodytype, presence: true
  validates :image, presence: true
  validates :remote_image_url, presence: true
  
  has_many :auto_reviews
  mount_uploader :image, ImageUploader
  
end
