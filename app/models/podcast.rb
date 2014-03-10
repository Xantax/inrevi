class Podcast < ActiveRecord::Base
  has_many :podcast_reviews
  belongs_to :podcast_language
  mount_uploader :image, ImageUploader
end
