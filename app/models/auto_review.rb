class AutoReview < ActiveRecord::Base
  
  acts_as_votable
  
  belongs_to :user
  belongs_to :auto
  validates :user_id, presence: true
  validates :auto_id, presence: true
  validates :title, presence: true
  validates :content, presence: true, length: { maximum: 10000, minimum: 140 }
  
end

