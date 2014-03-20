class TvshowReviewsController < ApplicationController
  before_action :set_tvshow_review, only: [:show, :edit, :update, :destroy]

  # GET /tvshow_reviews
  # GET /tvshow_reviews.json
  def index
    @tvshow_reviews = TvshowReview.all
  end

  # GET /tvshow_reviews/1
  # GET /tvshow_reviews/1.json
  def show
  end

  # GET /tvshow_reviews/new
  def new
    @tvshow_review = TvshowReview.new
  end

  # GET /tvshow_reviews/1/edit
  def edit
  end

  # POST /tvshow_reviews
  # POST /tvshow_reviews.json
  def create
    @tvshow_review = TvshowReview.new(tvshow_review_params)

    respond_to do |format|
      if @tvshow_review.save
        format.html { redirect_to @tvshow_review, notice: 'Tvshow review was successfully created.' }
        format.json { render action: 'show', status: :created, location: @tvshow_review }
      else
        format.html { render action: 'new' }
        format.json { render json: @tvshow_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tvshow_reviews/1
  # PATCH/PUT /tvshow_reviews/1.json
  def update
    respond_to do |format|
      if @tvshow_review.update(tvshow_review_params)
        format.html { redirect_to @tvshow_review, notice: 'Tvshow review was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @tvshow_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tvshow_reviews/1
  # DELETE /tvshow_reviews/1.json
  def destroy
    @tvshow_review.destroy
    respond_to do |format|
      format.html { redirect_to tvshow_reviews_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tvshow_review
      @tvshow_review = TvshowReview.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tvshow_review_params
      params.require(:tvshow_review).permit(:tvshow_id, :user_id, :title, :content)
    end
end
