class Drug < ActiveRecord::Base
  
  validates :name, presence: true
  validates :additionalinfo, presence: true
  validates :image, presence: true
  validates :remote_image_url, presence: true
  
  has_many :drug_reviews
  belongs_to :user
  
    validate :user_quota, :on => :create
  
  mount_uploader :image, ImageUploader
  
  searchable do
    text :name, :boost => 10
    text :additionalinfo
  end
  
  def user_quota
    if user.drugs.today.count >= 40
      errors.add(:base, "Exceeds daily limit (40/day)")
    end
  end  
  
end
