class FineartReviewsController < ApplicationController
  before_action :set_fineart_review, only: [:show, :edit, :update, :destroy]

  # GET /fineart_reviews
  # GET /fineart_reviews.json
  def index
    @fineart_reviews = FineartReview.all
  end

  # GET /fineart_reviews/1
  # GET /fineart_reviews/1.json
  def show
  end

  # GET /fineart_reviews/new
  def new
    @fineart_review = FineartReview.new
  end

  # GET /fineart_reviews/1/edit
  def edit
  end

  # POST /fineart_reviews
  # POST /fineart_reviews.json
  def create
    @fineart_review = FineartReview.new(fineart_review_params)

    respond_to do |format|
      if @fineart_review.save
        format.html { redirect_to @fineart_review, notice: 'Fineart review was successfully created.' }
        format.json { render action: 'show', status: :created, location: @fineart_review }
      else
        format.html { render action: 'new' }
        format.json { render json: @fineart_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fineart_reviews/1
  # PATCH/PUT /fineart_reviews/1.json
  def update
    respond_to do |format|
      if @fineart_review.update(fineart_review_params)
        format.html { redirect_to @fineart_review, notice: 'Fineart review was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @fineart_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fineart_reviews/1
  # DELETE /fineart_reviews/1.json
  def destroy
    @fineart_review.destroy
    respond_to do |format|
      format.html { redirect_to fineart_reviews_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fineart_review
      @fineart_review = FineartReview.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fineart_review_params
      params.require(:fineart_review).permit(:content, :user_id, :fineart_id)
    end
end
