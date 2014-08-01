class AutoReviewsController < ApplicationController
  before_action :set_auto_review, only: [:show, :destroy, :upvote, :downvote]
  before_action :set_auto, only: [:index, :new, :create]
  before_action :signed_in_user
  before_action :require_permission, only: :destroy
  before_action :only_admin, only: :all
  
  def index
    @auto_reviews = @auto.auto_reviews.order("cached_votes_score DESC").paginate(:page => params[:page], :per_page => 15)
  end

  def new
    @auto_review = AutoReview.new
    @auto_review.review_images.build
    @auto_review.review_images.build
    @auto_review.review_images.build
  end

  def create
    @auto_review = @auto.auto_reviews.build(auto_review_params)
    @auto_review.user = current_user

      if @auto_review.save
        @auto_review.create_activity :create, owner: current_user  
        
        redirect_to current_user
      else
        render action: 'new'
      end
  end

  def destroy
    @auto_review.destroy
    redirect_to current_user
  end
  
  def upvote
   @auto_review.liked_by current_user
   render nothing: true
  end

  def downvote
   @auto_review.downvote_from current_user
   render nothing: true
  end 

  private
    
    def set_auto
      @auto = Auto.find(params[:auto_id])
    end
  
    def set_auto_review
      @auto = Auto.find(params[:auto_id])
      @auto_review = @auto.auto_reviews.find(params[:id])
    end

    def auto_review_params
      params.require(:auto_review).permit(:content, :auto_id, :user_id, :point, :score,
        review_images_attributes: [:image, :attachable_id, :attachable_type])
    end
  
    def require_permission
      if current_user != AutoReview.find(params[:id]).user
        redirect_to root_path
      end
    end
    
    def only_admin
      unless current_user.admin?
        redirect_to root_path
      end
    end  
  
end
