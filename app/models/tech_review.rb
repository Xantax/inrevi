class TechReview < ActiveRecord::Base
  belongs_to :user
  belongs_to :tech
end
