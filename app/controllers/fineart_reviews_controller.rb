class FineartReviewsController < ApplicationController
  before_action :set_fineart_review, only: [:show, :destroy, :upvote, :downvote]
  before_action :set_fineart, only: [:index, :new, :create]
  before_action :signed_in_user
  before_action :require_permission, only: :destroy
  before_action :only_admin, only: :all
  
  def all
      @fineart_reviews = FineartReview.paginate(:page => params[:page], :per_page => 15).order("cached_votes_score ASC")
      render 'index'
  end
  
  def index
    @fineart_reviews = @fineart.fineart_reviews.paginate(:page => params[:page], :per_page => 15).order("cached_votes_score DESC")
  end

  def new
    @fineart_review = FineartReview.new
    @fineart_review.review_images.build 
    @fineart_review.review_images.build 
    @fineart_review.review_images.build     
  end

  def create
    @fineart_review = @fineart.fineart_reviews.build(fineart_review_params)
    @fineart_review.user = current_user

      if @fineart_review.save
        @fineart_review.create_activity :create, owner: current_user
        
        redirect_to current_user
      else
        render action: 'new'
      end
  end

  def destroy
    @fineart_review.destroy
      redirect_to current_user
  end
  
  def upvote
    @fineart_review.liked_by current_user
   render nothing: true
  end

  def downvote
    @fineart_review.downvote_from current_user
    render nothing: true    
  end

  private

  def set_fineart
    @fineart = Fineart.find(params[:fineart_id])
    end
  
  def set_fineart_review
    @fineart = Fineart.find(params[:fineart_id])
    @fineart_review = @fineart.fineart_reviews.find(params[:id])
  end

    def fineart_review_params
      params.require(:fineart_review).permit(:content, :user_id, :fineart_id, :point, :score,
        review_images_attributes: [:image, :attachable_id, :attachable_type])
    end
  
    def require_permission
      if current_user != FineartReview.find(params[:id]).user
        redirect_to root_path
      end
    end
    
    def only_admin
      unless current_user.admin?
        redirect_to root_path
      end
    end 
  
end
