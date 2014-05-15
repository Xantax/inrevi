class TvshowReview < ActiveRecord::Base
 include PublicActivity::Common 
  
  attr_accessor :image, :file
  
  acts_as_votable

  belongs_to :user
  belongs_to :tvshow
  
    validate :user_quota, :on => :create
  
  has_many :review_images, :as => :attachable, :dependent => :destroy
  accepts_nested_attributes_for :review_images
  
  validates :user_id, presence: true

  validates :content, presence: true
  
  validates_numericality_of :point, greater_than_or_equal_to: 0
  
  def user_quota
    if user.tvshow_reviews.today.count >= 20
      errors.add(:base, "Exceeds daily limit. You can only create 20 reviews/day")
    end
  end 
  
end
