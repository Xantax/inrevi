class AutoReviewsController < ApplicationController
  before_action :set_auto_review, only: [:show, :destroy, :upvote, :downvote]
  before_action :set_auto, only: [:index, :new, :create]

  def all
    @auto_reviews = AutoReview.order("cached_votes_score ASC").paginate(:page => params[:page], :per_page => 15)
    render 'index'
  end
  
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

  def update
    @auto_review.review_images.build if @auto_review.review_images.empty?

      if @auto_review.update(auto_review_params)
        redirect_to root_path, notice: 'Auto review was successfully updated.'
      else
        render action: 'edit'
      end
  end

  def destroy
    @auto_review.destroy
      redirect_to auto_path(@auto_review.auto)
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
  
end
