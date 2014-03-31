class Review < ActiveRecord::Base
  belongs_to :reviewable, polymorphic: true
  
  belongs_to :user
  
  validates :user_id, presence: true
  validates :title, presence: true
  validates :content, presence: true, length: { maximum: 10000, minimum: 140 }
end
