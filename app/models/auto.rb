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
  
  
  def user_quota
    if user.autos.today.count >= 10
      errors.add(:base, "Exceeds daily limit. You can't create more today (SPAM prevention)")
    end
  end  
  
end
