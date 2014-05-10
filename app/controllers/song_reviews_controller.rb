class SongReviewsController < ApplicationController
  before_action :set_song_review, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_action :set_song, [:new, :create, :show]

  def all
    @all_song_reviews = SongReview.order("cached_votes_score ASC")
  end
  
  def index
    @song_reviews = SongReview.order("cached_votes_score ASC").all
  end

  def show
  end

  def new
    @song_review = SongReview.new
    @song_review.review_images.build  
  end

  def edit
  end

  def create
    @song_review = SongReview.new(song_review_params)
    @song_review.user = current_user

    respond_to do |format|
      if @song_review.save
        @song_review.create_activity :create, owner: current_user
        
        format.html { redirect_to song_song_review_path(@song.uri, @song_review), notice: 'Song review was successfully created.' }
        format.json { render action: 'show', status: :created, location: @song_review }
      else
        format.html { render action: 'new' }
        format.json { render json: @song_review.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @song_review.update(song_review_params)
        format.html { redirect_to @song_review, notice: 'Song review was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @song_review.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @song_review.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { head :no_content }
    end
  end

  def upvote
   @song_review.liked_by current_user
   render nothing: true
  end

  def downvote
    @song_review.downvote_from current_user
  end
  
  private

    def set_song_review
      @song_review = SongReview.find(params[:id])
    end
  
    def set_song
      @song = Song.retrieve params[:song_id]
    end

    def song_review_params
      params.require(:song_review).permit(:title, :content, :user_id, :song_id, :point, :score,
        :song_name, :song_artists, :song_album, :song_isrc,
        review_images_attributes: [:image, :attachable_id, :attachable_type])
    end
end
