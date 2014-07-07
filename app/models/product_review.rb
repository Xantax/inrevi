class ProductReview < ActiveRecord::Base
include PublicActivity::Common 
  
  attr_accessor :image, :file
  
  acts_as_votable
  
  belongs_to :user, :counter_cache => true
  belongs_to :product
  
    validate :user_quota, :on => :create
  
  has_many :review_images, :as => :attachable, :dependent => :destroy
  accepts_nested_attributes_for :review_images
  
  validates :user_id, presence: true
  
  validates_numericality_of :point, greater_than_or_equal_to: 0
  
  def user_quota
    if user.product_reviews.today.count >= 40
      errors.add(:base, "You can't create more reviews today!")
    end
  end
end
