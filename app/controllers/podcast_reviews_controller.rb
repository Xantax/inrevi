class PodcastReviewsController < ApplicationController
  before_action :set_podcast_review, only: [:show, :edit, :update, :destroy]
  before_action :set_podcast, only: [:index, :show, :new, :create, :edit]
  
  def all
    @all_podcast_reviews = PodcastReview.paginate(:page => params[:page], :per_page => 10).order("cached_votes_score ASC")
  end
  
  def index
    @podcast_reviews = @podcast.podcast_reviews.paginate(:page => params[:page], :per_page => 10).order("cached_votes_score DESC")
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

      if @podcast_review.save
        @podcast_review.create_activity :create, owner: current_user
        
        redirect_to [@podcast, @podcast_review], notice: 'Share your review'
      else
        render action: 'new'
      end
  end

  def update
    @podcast_review.review_images.build if @podcast_review.review_images.empty?

      if @podcast_review.update(podcast_review_params)
        redirect_to root_path, notice: 'Review was successfully updated.'
      else
        render action: 'edit'
      end
  end

  def destroy
    @podcast_review.destroy
      redirect_to root_path
  end
  
  def upvote
   @podcast_review.liked_by current_user
   render nothing: true
  end

  def downvote
    @podcast_review.downvote_from current_user
    render nothing: true    
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
      params.require(:podcast_review).permit(:content, :user_id, :podcast_id, :point, :score,
        review_images_attributes: [:image, :attachable_id, :attachable_type])
    end
end
