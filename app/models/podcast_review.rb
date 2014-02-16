class PodcastReview < ActiveRecord::Base
  belongs_to :podcast
  validates :podcast_id, presence: true
end
