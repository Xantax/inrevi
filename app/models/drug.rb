class Drug < ActiveRecord::Base
  acts_as_taggable
  
  validates :name, presence: true
  validates :tag_list, presence: true
  validates :image, presence: true
  validates :remote_image_url, presence: true
  
  mount_uploader :image, ImageUploader
  
  searchable do
    text :name
    text :tag_list, :boost => 5 
  end
  
end
