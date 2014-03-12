class AutoReview < ActiveRecord::Base
  belongs_to :user
  belongs_to :auto
end
