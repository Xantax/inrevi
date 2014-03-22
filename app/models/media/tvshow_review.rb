class Media::TvshowReview < ActiveRecord::Base
  belongs_to :tvshow
  belongs_to :user
end
