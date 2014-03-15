class TechReviewsController < ApplicationController
  before_action :set_tech_review, only: [:show, :edit, :update, :destroy]
  before_action :set_tech

  def index
    @tech_reviews = TechReview.all
  end

  def show
  end

  def new
    @tech_review = TechReview.new
  end

  def edit
  end

  def create
    @tech_review = @tech.tech_reviews.build(tech_review_params)
    @tech_review.user = current_user

    respond_to do |format|
      if @tech_review.save
        format.html { redirect_to @tech_review, notice: 'Tech review was successfully created.' }
        format.json { render action: 'show', status: :created, location: @tech_review }
      else
        format.html { render action: 'new' }
        format.json { render json: @tech_review.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @tech_review = @tech.tech_reviews.build(tech_review_params)
    @tech_review.user = current_user
    
    respond_to do |format|
      if @tech_review.update(tech_review_params)
        format.html { redirect_to [@tech, @tech_review], notice: 'Tech review was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @tech_review.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @tech_review.destroy
    respond_to do |format|
      format.html { redirect_to tech_reviews_url }
      format.json { head :no_content }
    end
  end

  private
  
    def set_tech
      @tech = Tech.find(params[:tech_id])
    end
    
    def set_tech_review
      @tech_review = TechReview.find(params[:id])
    end

    def tech_review_params
      params.require(:tech_review).permit(:title, :content, :user_id, :tech_id)
    end
end
