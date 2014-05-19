module Tmdb
  class Movie < Resource
    def comments
      MovieReview.find_all_by_movie_id(id)
    end
  end  
end