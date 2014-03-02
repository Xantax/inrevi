class PodcastReview < ActiveRecord::Base
  belongs_to :podcast
  validates :podcast_id, presence: true
  belongs_to :user
  validates :user_id, presence: true
  has_many :podcast_ratings
  
  def average_podcast_rating
    podcast_ratings.sum(:score) / podcast_ratings.size
  end
  
end
