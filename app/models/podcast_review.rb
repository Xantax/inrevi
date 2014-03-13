class PodcastReview < ActiveRecord::Base
  
  belongs_to :podcast
  validates :podcast_id, presence: true
  belongs_to :user
  validates :user_id, presence: true
  validates :title, presence: true
  validates :content, presence: true, length: { maximum: 5000, minimum: 100 }
  
end
