class SongsController < ApplicationController
 before_action :signed_in_user, except: [:show, :index, :search]
   
  def index
    @songs = Song.search params
  end

  def search
    @songs = Song.search params
    render 'index'   
  end

  def show
    @song = Song.retrieve params[:id]    
    @song_reviews = SongReview.where(song_id: params[:id]).paginate(:page => params[:page], :per_page => 15).order("cached_votes_score DESC")    
    @avg_score = 0
    @avg_score = @song_reviews.inject(0) { |sum, r| sum += r.point }.to_f / @song_reviews.count if @song_reviews.count > 0
  end
  
end
