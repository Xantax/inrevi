class Tech < ActiveRecord::Base
  acts_as_taggable
  
  has_many :tech_reviews
  belongs_to :user
  
    validate :user_quota, :on => :create

  validates :name, presence: true
  validates :tag_list, presence: true
  validates :image, presence: true
  validates :remote_image_url, presence: true
  
  mount_uploader :image, ImageUploader
  
  searchable do
    text :name
    text :tag_list, :boost => 5
  end
  
  def user_quota
    if user.teches.today.count >= 30
      errors.add(:base, "Exceeds daily limit (30/day)")
    end
  end  
  
end
