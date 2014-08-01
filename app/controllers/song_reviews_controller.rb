class SongReviewsController < ApplicationController
  before_action :set_song_review, only: [:show, :destroy, :upvote, :downvote]
  before_action :signed_in_user
  before_action :require_permission, only: :destroy
  before_action :only_admin, only: :all
 
  def index
    @song_reviews = SongReview.paginate(:page => params[:page], :per_page => 15).order("cached_votes_score DESC")
  end

  def new
    @song = Song.retrieve params[:song_id]
    @song_review = SongReview.new
    @song_review.review_images.build 
    @song_review.review_images.build  
    @song_review.review_images.build  
  end

  def create
    @song = Song.retrieve params[:song_id]
    @song_review = SongReview.new(song_review_params)
    @song_review.user = current_user

      if @song_review.save
        @song_review.create_activity :create, owner: current_user
        
        redirect_to current_user
      else
        render action: 'new'
      end
  end

  def destroy
    @song_review.destroy
      redirect_to current_user
  end

  def upvote
   @song_review.liked_by current_user
   render nothing: true
  end

  def downvote
    @song_review.downvote_from current_user
    render nothing: true    
  end
  
  private

    def set_song_review
      @song_review = SongReview.find(params[:id])
    end
  
    def set_song
      @song = Song.retrieve params[:song_id]
    end

    def song_review_params
      params.require(:song_review).permit(:content, :user_id, :song_id, :point, :score,
        :song_name, :song_artists, :song_album, :song_isrc,
        review_images_attributes: [:image, :attachable_id, :attachable_type])
    end
  
    def require_permission
      if current_user != SongReview.find(params[:id]).user
        redirect_to root_path
      end
    end 
    
    def only_admin
      unless current_user.admin?
        redirect_to root_path
      end
    end  
  
end
