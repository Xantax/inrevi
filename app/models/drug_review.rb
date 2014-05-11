class DrugReview < ActiveRecord::Base
  belongs_to :user
  belongs_to :drug
end
