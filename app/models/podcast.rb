class Podcast < ActiveRecord::Base
  acts_as_taggable
  
  has_many :podcast_reviews
  belongs_to :podcast_language
  mount_uploader :image, ImageUploader
  
  searchable do
    text :name
    text :tag_list, :boost => 5 
  end
  
end
