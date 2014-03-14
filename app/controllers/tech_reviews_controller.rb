class TechReviewsController < ApplicationController
  before_action :set_tech_review, only: [:show, :edit, :update, :destroy]

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
    @tech_review = TechReview.new(tech_review_params)

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
    respond_to do |format|
      if @tech_review.update(tech_review_params)
        format.html { redirect_to @tech_review, notice: 'Tech review was successfully updated.' }
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
    # Use callbacks to share common setup or constraints between actions.
    def set_tech_review
      @tech_review = TechReview.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tech_review_params
      params.require(:tech_review).permit(:title, :content, :user_id, :tech_id)
    end
end
