class PodcastSubCategory < ActiveRecord::Base
  belongs_to :podcast_category
  has_many :podcasts
end
