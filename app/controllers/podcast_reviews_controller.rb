class PodcastReviewsController < ApplicationController
  before_action :set_podcast_review, only: [:show, :destroy, :upvote, :downvote]
  before_action :set_podcast, only: [:index, :new, :create]
  before_action :signed_in_user
  before_action :require_permission, only: :destroy
  before_action :only_admin, only: :all
  
  def all
      @podcast_reviews = PodcastReview.paginate(:page => params[:page], :per_page => 15).order("cached_votes_score ASC")
      render 'index'
  end
  
  def index
    @podcast_reviews = @podcast.podcast_reviews.paginate(:page => params[:page], :per_page => 15).order("cached_votes_score DESC")
  end

  def new
    @podcast_review = PodcastReview.new
    @podcast_review.review_images.build
    @podcast_review.review_images.build  
    @podcast_review.review_images.build  
  end

  def create
    @podcast_review = @podcast.podcast_reviews.build(podcast_review_params)
    @podcast_review.user = current_user

      if @podcast_review.save
        @podcast_review.create_activity :create, owner: current_user
        
        redirect_to current_user
      else
        render action: 'new'
      end
  end

  def destroy
    @podcast_review.destroy
      redirect_to current_user
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
  
    def require_permission
      if current_user != PodcastReview.find(params[:id]).user
        redirect_to root_path
      end
    end 
    
    def only_admin
      unless current_user.admin?
        redirect_to root_path
      end
    end 
  
end
