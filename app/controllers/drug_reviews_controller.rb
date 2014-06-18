class DrugReviewsController < ApplicationController
  before_action :set_drug_review, only: [:show, :destroy, :upvote, :downvote]
  before_action :set_drug, only: [:index, :new, :create]
  before_action :signed_in_user

  def all
    if current_user.admin?
      @drug_reviews = DrugReview.paginate(:page => params[:page], :per_page => 15).order("cached_votes_score ASC")
      render 'index'
    end
  end
  
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

  def update
    @drug_review.review_images.build if @drug_review.review_images.empty?
    
      if @drug_review.update(auto_review_params)
        redirect_to root_path, notice: 'Review was successfully updated.'
      else
        render action: 'edit'
      end
  end

  def destroy
    @auto_review.destroy
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
  
end