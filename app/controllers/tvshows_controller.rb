class TvshowsController < ApplicationController
  require 'themoviedb'

  before_filter :set_config
  Tmdb::Api.key("a8ddb278788ceab2a58875b7f172c327")

  def set_config
  	@configuration = Tmdb::Configuration.new
  end
    
  def index
    @popular = Tmdb::TV.popular
  end

  def show
    @tvshow = Tmdb::TV.detail(params[:id])
  end
  
  def search
    @tvshow = Tmdb::TV.find(params[:query])
  end
  
end
