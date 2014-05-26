class TechReviewsController < ApplicationController
  before_action :set_tech_review, only: [:show, :destroy, :upvote, :downvote]
  before_action :set_tech, only: [:index, :new, :create]
  
  def all
    @tech_reviews = TechReview.paginate(:page => params[:page], :per_page => 15).order("cached_votes_score ASC")
    render 'index'
  end
  
  def index
    @tech_reviews = @tech.tech_reviews.paginate(:page => params[:page], :per_page => 15).order("cached_votes_score DESC")
  end

  def show
  end

  def new
    @tech_review = TechReview.new
    @tech_review.review_images.build
    @tech_review.review_images.build 
    @tech_review.review_images.build 
  end

  def edit
  end

  def create
    @tech_review = @tech.tech_reviews.build(tech_review_params)
    @tech_review.user = current_user

      if @tech_review.save
        @tech_review.create_activity :create, owner: current_user
        
        redirect_to current_user
      else
        render action: 'new'
      end
  end

  def update
    @tech_review.review_images.build if @tech_review.review_images.empty?

      if @tech_review.update(tech_review_params)
        redirect_to @tech_review
      else
        render action: 'edit'
      end
  end

  def destroy
    @tech_review.destroy
      redirect_to root_path
  end
  
  def upvote
    @tech_review.liked_by current_user
   render nothing: true
  end

  def downvote
    @tech_review.downvote_from current_user
    render nothing: true    
  end

  private

  def set_tech
    @tech = Tech.find(params[:tech_id])
    end
  
  def set_tech_review
    @tech = Tech.find(params[:tech_id])
    @tech_review = @tech.tech_reviews.find(params[:id])
  end

    def tech_review_params
      params.require(:tech_review).permit(:content, :user_id, :tech_id, :point, :score,
        review_images_attributes: [:image, :attachable_id, :attachable_type])
    end
end
