class Auto < ActiveRecord::Base
  
  validates :name, presence: true
  validates :additionalinfo, presence: true
  validates :image, presence: true
  validates :remote_image_url, presence: true
  
  has_many :auto_reviews
  has_many :auto_review_reports
  
  mount_uploader :image, ImageUploader
  
end
