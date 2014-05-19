class SongReviewsController < ApplicationController
  before_action :set_song_review, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_action :set_song, [:new, :create, :show]

  
  def index
    @song_reviews = SongReview.paginate(:page => params[:page], :per_page => 10).order("cached_votes_score ASC")
  end

  def show
  end

  def new
    @song_review = SongReview.new
    @song_review.review_images.build 
    @song_review.review_images.build  
    @song_review.review_images.build  
  end

  def edit
  end

  def create
    @song_review = SongReview.new(song_review_params)
    @song_review.user = current_user

      if @song_review.save
        @song_review.create_activity :create, owner: current_user
        
        redirect_to song_song_review_path(@song.uri, @song_review), notice: 'Share your review'
      else
        render action: 'new'
      end
  end

  def update
      if @song_review.update(song_review_params)
        redirect_to @song_review
      else
        render action: 'edit'
      end
  end

  def destroy
    @song_review.destroy
      redirect_to root_path
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
end
