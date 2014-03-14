class TechReview < ActiveRecord::Base
  belongs_to :user
  belongs_to :tech
  
  validates :user_id, presence: true
  validates :title, presence: true
  validates :content, presence: true, length: { maximum: 5000, minimum: 100 }
end
