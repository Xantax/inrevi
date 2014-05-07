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
