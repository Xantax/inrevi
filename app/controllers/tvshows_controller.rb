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
    
    @tvshow_reviews = TvshowReview.where(tvshow_ident: params[:id]).published.order("cached_votes_score DESC")
    
    @avg_score = 0
    @avg_score = @tvshow_reviews.inject(0) { |sum, r| sum += r.point }.to_f / @tvshow_reviews.count if @tvshow_reviews.count > 0
  end
  
  def search
    @tvshow = Tmdb::TV.find(params[:query])
  end
  
end
