class Podcast < ActiveRecord::Base
  belongs_to :podcast_category
  belongs_to :podcast_sub_category
  has_many :podcast_reviews
  belongs_to :podcast_language
  mount_uploader :image, ImageUploader
end
