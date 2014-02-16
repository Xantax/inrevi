class Movie < ActiveRecord::Base
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  
  has_many :movie_reviews
  accepts_nested_attributes_for :movie_reviews
  
  def movie_reviews
    @movie_review
  end

  def movie_reviews_attributes=(attributes)
    # Process the attributes hash
  end
end
