class AutoReview < ActiveRecord::Base
  
  acts_as_votable
  
  belongs_to :user
  belongs_to :auto
  validates :user_id, presence: true
  validates :auto_id, presence: true
  validates :title, presence: true
  validates :content, presence: true, length: { maximum: 5000, minimum: 140 }
  
  validates_numericality_of :point, greater_than_or_equal_to: 0
  
end

