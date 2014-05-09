class PodcastReviewsController < ApplicationController
  before_action :set_podcast_review, only: [:show, :edit, :update, :destroy]
  before_action :set_podcast, only: [:index, :show, :new, :create, :edit]
  
  def all
    @all_podcast_reviews = PodcastReview.published.order("cached_votes_score ASC")
  end
  
  def unpublished
    @all_podcast_reviews = PodcastReview.unpublished.order("cached_votes_score ASC")
  end
  
  def index
    @podcast_reviews = @podcast.podcast_reviews.published.order("cached_votes_score DESC")
    @avg_score = 0
    @avg_score = @podcast_reviews.inject(0) { |sum, r| sum += r.point }.to_f / @podcast_reviews.count if @podcast_reviews.count > 0
  end

  def show
  end

  def new
    @podcast_review = PodcastReview.new
    @podcast_review.review_images.build  
  end

  def edit
  end

  def create
    @podcast_review = @podcast.podcast_reviews.build(podcast_review_params)
    @podcast_review.user = current_user

    respond_to do |format|
      if @podcast_review.save
        @podcast_review.create_activity :create, owner: current_user
        
        format.html { redirect_to [@podcast, @podcast_review], notice: 'Thank you. Share your review' }
        format.json { render action: 'show', status: :created, location: @podcast_review }
      else
        format.html { render action: 'new' }
        format.json { render json: @podcast_review.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @podcast_review.review_images.build if @podcast_review.review_images.empty?
    
    respond_to do |format|
      if @podcast_review.update(podcast_review_params)
        format.html { redirect_to root_path, notice: 'Podcast review was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @podcast_review.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @podcast_review.destroy
    respond_to do |format|
      format.html { redirect_to podcast_reviews_url }
      format.json { head :no_content }
    end
  end
  
  def upvote
   @podcast_review.liked_by current_user
   render nothing: true
  end

  def downvote
    @podcast_review.downvote_from current_user
  end

  private
  
    def set_podcast
      @podcast = Podcast.find(params[:podcast_id])
    end

    def set_podcast_review
      @podcast = Podcast.find(params[:podcast_id])
      @podcast_review = @podcast.podcast_reviews.find(params[:id])
    end

    def podcast_review_params
      params.require(:podcast_review).permit(:title, :content, :user_id, :podcast_id, :point, :score, :published, 
        review_images_attributes: [:image, :attachable_id, :attachable_type])
    end
end
