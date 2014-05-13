class DrugReviewsController < ApplicationController
  before_action :set_auto_review, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_action :set_auto, only: [:index, :show, :new, :create, :edit]

  def all
    @all_drug_reviews = DrugReview.paginate(:page => params[:page], :per_page => 10).order("cached_votes_score ASC")
  end
  
  def index
    @drug_reviews = @drug.drug_reviews.order("cached_votes_score DESC")
  end

  def show    
  end

  def new
    @drug_review = DrugReview.new
    @drug_review.review_images.build  
  end

  def edit
  end

  def create
    @drug_review = @drug.drug_reviews.build(drug_review_params)
    @drug_review.user = current_user

    respond_to do |format|
      if @drug_review.save
        @drug_review.create_activity :create, owner: current_user
        
        format.html { redirect_to [@drug, @drug_review], notice: 'Thank you. Share your review' }
        format.json { render action: 'index', status: :created, location: @auto_review }
      else
        format.html { render action: 'new' }
        format.json { render json: @drug_review.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @drug_review.review_images.build if @drug_review.review_images.empty?
    
    respond_to do |format|
      if @drug_review.update(auto_review_params)
        format.html { redirect_to root_path, notice: 'Auto review was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @drug_review.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @auto_review.destroy
    respond_to do |format|
      format.html { redirect_to drug_path(@drug_review.drug) }
      format.json { head :no_content }
    end
  end
  
  def upvote
   @drug_review.liked_by current_user
   render nothing: true
  end

  def downvote
   @drug_review.downvote_from current_user
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
      params.require(:drug_review).permit(:title, :content, :drug_id, :user_id, :point, :score,
        review_images_attributes: [:image, :attachable_id, :attachable_type])
    end
  
end