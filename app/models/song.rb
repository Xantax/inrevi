class Song < ActiveRecord::Base
  class << self
    def search(params)
      MetaSpotify::Track.search(params[:query], page: page(params))
    end

    def page(params)
      params[:page].present? ? params[:page].to_i : 1
    end

    def retrieve(id)
      MetaSpotify::Track.lookup id
    end
  end
end

module MetaSpotify
  class Track
    def comments
      SongReview.find_all_by_song_id(uri)
    end
  end
end
