class SongReview < ActiveRecord::Base
include PublicActivity::Common 
  
  attr_accessor :image, :file
  
  acts_as_votable
  
  belongs_to :user, :counter_cache => true
  belongs_to :song
  
    validate :user_quota, :on => :create
  
  has_many :review_images, :as => :attachable, :dependent => :destroy
  accepts_nested_attributes_for :review_images
  
  validates :user_id, presence: true
  validates :song_id, presence: true
  validates :content, presence: true
  
  validates_numericality_of :point, greater_than_or_equal_to: 0
  
   def user_quota
    if user.song_reviews.today.count >= 10
      errors.add(:base, "You can't create more reviews today!")
    end
  end 
  
end
