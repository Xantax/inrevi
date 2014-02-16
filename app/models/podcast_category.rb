class PodcastCategory < ActiveRecord::Base
  has_many :podcast_sub_categories
  has_many :podcasts
end
