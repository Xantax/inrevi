class AutoReviewReport < ActiveRecord::Base
  belongs_to :user
  belongs_to :auto_review
end
