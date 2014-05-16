class FineartReview < ActiveRecord::Base
  belongs_to :user
  belongs_to :fineart
end
