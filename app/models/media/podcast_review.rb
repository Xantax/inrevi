module Media
class PodcastReview < ActiveRecord::Base  
  belongs_to :podcast
  belongs_to :user
  
  validates :podcast_id, presence: true
  validates :user_id, presence: true
  validates :title, presence: true
  validates :content, presence: true, length: { maximum: 5000, minimum: 100 }
 end  
end
