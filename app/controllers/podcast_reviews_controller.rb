class PodcastReviewsController < ApplicationController
  before_action :set_podcast_review, only: [:show, :edit, :update, :destroy]

  # GET /podcast_reviews
  # GET /podcast_reviews.json
  def index
    @podcast = Podcast.find(params[:podcast_id])
    @podcast_reviews = PodcastReview.all
  end

  # GET /podcast_reviews/1
  # GET /podcast_reviews/1.json
  def show
    @podcast = Podcast.find(params[:podcast_id])
  end

  # GET /podcast_reviews/new
  def new
    @podcast = Podcast.find(params[:podcast_id])
    @podcast_review = PodcastReview.new
  end

  # GET /podcast_reviews/1/edit
  def edit
  end

  # POST /podcast_reviews
  # POST /podcast_reviews.json
  def create
    podcast = Podcast.find(params[:podcast_id])
    @podcast_review = podcast.podcast_reviews.build(podcast_review_params)

    respond_to do |format|
      if @podcast_review.save
        format.html { redirect_to [podcast, @podcast_review], notice: 'Podcast review was successfully created.' }
        format.json { render action: 'show', status: :created, location: @podcast_review }
      else
        format.html { render action: 'new' }
        format.json { render json: @podcast_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /podcast_reviews/1
  # PATCH/PUT /podcast_reviews/1.json
  def update
    respond_to do |format|
      if @podcast_review.update(podcast_review_params)
        format.html { redirect_to @podcast_review, notice: 'Podcast review was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @podcast_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /podcast_reviews/1
  # DELETE /podcast_reviews/1.json
  def destroy
    @podcast_review.destroy
    respond_to do |format|
      format.html { redirect_to podcast_reviews_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_podcast_review
      @podcast_review = PodcastReview.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def podcast_review_params
      params.require(:podcast_review).permit(:title, :content, :podcast_id)
    end
end
