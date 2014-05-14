class Auto < ActiveRecord::Base
  
  validates :name, presence: true
  validates :additionalinfo, presence: true
  validates :image, presence: true
#  validates :remote_image_url, presence: true
  
  has_many :auto_reviews
  belongs_to :user
  
    validate :user_quota, :on => :create
  
  validates :user_id, presence: true
  
  mount_uploader :image, ImageUploader
  
  searchable do
    text :name, :boost => 10
    text :additionalinfo
  end
  
  def user_quota
    if user.autos.today.count >= 40
      errors.add(:base, "Exceeds daily limit (40/day)")
    end
  end  
  
end
