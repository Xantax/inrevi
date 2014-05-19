module Tmdb
  class TV < Resource
    def comments
      TvshowReview.find_all_by_tvshow_id(id)
    end
  end
end