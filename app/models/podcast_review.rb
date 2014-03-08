class PodcastReview < ActiveRecord::Base
  acts_as_votable
  
  belongs_to :podcast
  validates :podcast_id, presence: true
  belongs_to :user
  validates :user_id, presence: true
  has_many :podcast_ratings
  
  
  def total_podcast_reviews_likes
    self.podcast_reviews_likes.where(podcast_reviews_like: true).size - self.podcast_reviews_likes.where(podcast_reviews_like: false).size
  end
  
end
