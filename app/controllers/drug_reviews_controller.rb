class DrugReviewsController < ApplicationController
  before_action :set_drug_review, only: [:show, :destroy, :upvote, :downvote]
  before_action :set_drug, only: [:index, :new, :create]
  before_action :signed_in_user
  before_action :require_permission, only: :destroy
  before_action :only_admin, only: :all
  
  def index
    @drug_reviews = @drug.drug_reviews.paginate(:page => params[:page], :per_page => 15).order("cached_votes_score DESC")
  end

  def new
    @drug_review = DrugReview.new
    @drug_review.review_images.build 
    @drug_review.review_images.build  
    @drug_review.review_images.build  
  end

  def create
    @drug_review = @drug.drug_reviews.build(drug_review_params)
    @drug_review.user = current_user

      if @drug_review.save
        @drug_review.create_activity :create, owner: current_user
        
        redirect_to current_user
      else
        render action: 'new'
      end
  end

  def destroy
    @drug_review.destroy
      redirect_to current_user
  end
  
  def upvote
   @drug_review.liked_by current_user
   render nothing: true
  end

  def downvote
   @drug_review.downvote_from current_user
   render nothing: true    
  end 

  private
    
    def set_drug
      @drug = Drug.find(params[:drug_id])
    end
  
    def set_drug_review
      @drug = Drug.find(params[:drug_id])
      @drug_review = @drug.drug_reviews.find(params[:id])
    end

    def drug_review_params
      params.require(:drug_review).permit(:content, :drug_id, :user_id, :point, :score,
        review_images_attributes: [:image, :attachable_id, :attachable_type])
    end
  
    def require_permission
      if current_user != DrugReview.find(params[:id]).user
        redirect_to root_path
      end
    end
    
    def only_admin
      unless current_user.admin?
        redirect_to root_path
      end
    end 
  
end