class MovieReview < ActiveRecord::Base
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  belongs_to :movie
end
