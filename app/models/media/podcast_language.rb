class Media::PodcastLanguage < ActiveRecord::Base
  has_many :podcasts
end
