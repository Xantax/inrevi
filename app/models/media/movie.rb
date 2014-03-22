class Media::Movie < ActiveRecord::Base
  
 has_many :movie_reviews
  
end
