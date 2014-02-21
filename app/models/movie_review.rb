class MovieReview < ActiveRecord::Base
  
  belongs_to :movie
  belongs_to :user
  validates :user_id, presence: true
end
