class AutoReviewsController < ApplicationController
  before_action :set_auto_review, only: [:show, :edit, :update, :destroy]

  def index
    @auto = Auto.find(params[:auto_id])
    @auto_reviews = AutoReview.all
  end

  def show
    @auto = Auto.find(params[:auto_id])
  end

  def new
    @auto = Auto.find(params[:auto_id])
    @auto_review = AutoReview.new 
  end

  def edit
    @auto = Auto.find(params[:auto_id])
  end

  def create
    @auto = Auto.find(params[:auto_id])
    @auto_review = @auto.auto_reviews.build(auto_review_params)
    @auto_review.user = current_user

    respond_to do |format|
      if @auto_review.save
        format.html { redirect_to [@auto, @auto_review], notice: 'Auto review was successfully created.' }
        format.json { render action: 'index', status: :created, location: @auto_review }
      else
        format.html { render action: 'new' }
        format.json { render json: @auto_review.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @auto = Auto.find(params[:podcast_id])
    @auto_review = @auto.auto_reviews.build(auto_review_params)
    @auto_review.user = current_user
    
    respond_to do |format|
      if @auto_review.update(podcast_review_params)
        format.html { redirect_to [@auto, @auto_review], notice: 'Auto review was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @auto_review.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @auto_review.destroy
    respond_to do |format|
      format.html { redirect_to auto_reviews_url }
      format.json { head :no_content }
    end
  end

   

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auto_review
      @auto_review = AutoReview.find(params[:id])
    end

    def auto_review_params
      params.require(:auto_review).permit(:title, :content, :auto_id, :user_id)
    end
  
end
