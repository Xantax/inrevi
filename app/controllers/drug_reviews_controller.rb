class DrugReviewsController < ApplicationController
  before_action :set_drug_review, only: [:show, :edit, :update, :destroy]
  before_action :set_drug
  before_action :signed_in_user, only: [:new]

  def index
    @drug_reviews = DrugReview.all
  end

  def show
  end

  def new
    @drug_review = DrugReview.new
  end

  def edit
  end

  def create
    @drug_review = @drug.drug_reviews.build(drug_review_params)
    @drug_review.user = current_user

    respond_to do |format|
      if @drug_review.save
        format.html { redirect_to [@drug, @drug_review], notice: 'Drug review was successfully created.' }
        format.json { render action: 'show', status: :created, location: @drug_review }
      else
        format.html { render action: 'new' }
        format.json { render json: @drug_review.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @drug_review = @drug.drug_reviews.build(drug_review_params)
    @drug_review.user = current_user
    
    respond_to do |format|
      if @drug_review.update(drug_review_params)
        format.html { redirect_to @drug_review, notice: 'Drug review was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @drug_review.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @drug_review.destroy
    respond_to do |format|
      format.html { redirect_to drug_reviews_url }
      format.json { head :no_content }
    end
  end

  private
  
    def set_drug
      @drug = Drug.find(params[:drug_id])
    end

    def set_drug_review
      @drug_review = DrugReview.find(params[:id])
    end

    def drug_review_params
      params.require(:drug_review).permit(:title, :content, :user_id, :drug_id)
    end
end
