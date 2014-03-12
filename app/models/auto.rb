class Auto < ActiveRecord::Base
  has_many :auto_reviews
  mount_uploader :image, ImageUploader
  
  searchable do
    text :name, :boost => 5
    text :bodytype
  end
  
end
