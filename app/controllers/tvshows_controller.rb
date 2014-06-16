class TvshowsController < ApplicationController
  before_action :signed_in_user, except: [:show]
  
  require 'themoviedb'

  before_filter :set_config
  Tmdb::Api.key(ENV["TMDB_KEY"])

  def set_config
  	@configuration = Tmdb::Configuration.new
  end
    
  def index
    @popular = Tmdb::TV.popular
  end

  def show
    @tvshow = Tmdb::TV.detail(params[:id])
    
    @tvshow_reviews = TvshowReview.where(tvshow_id: params[:id]).paginate(:page => params[:page], :per_page => 15).order("cached_votes_score DESC")
    
    @avg_score = 0
    @avg_score = @tvshow_reviews.inject(0) { |sum, r| sum += r.point }.to_f / @tvshow_reviews.count if @tvshow_reviews.count > 0
    
    @promotion = Promotion.order("RANDOM()").first
  end
  
  def search
    @tvshow = Tmdb::TV.find(params[:query])    
  end
  
end
