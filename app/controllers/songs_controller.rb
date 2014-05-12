class SongsController < ApplicationController
 
  def index
  end

  def search
    @songs = Song.search params
    render 'index'
    
    @avg_score = 0
    @avg_score = @song_reviews.inject(0) { |sum, r| sum += r.point }.to_f / @song_reviews.count if @song_reviews.count > 0
    
  end

  def show
    @song = Song.retrieve params[:id]
    
    @song_reviews = SongReview.where(song_id: params[:id]).order("cached_votes_score DESC")
    
    @avg_score = 0
    @avg_score = @song_reviews.inject(0) { |sum, r| sum += r.point }.to_f / @song_reviews.count if @song_reviews.count > 0
    
    @promotion = Promotion.order("RANDOM()").first
  end
  
end
