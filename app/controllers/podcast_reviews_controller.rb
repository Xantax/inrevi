class PodcastReviewsController < ApplicationController
  before_action :set_podcast_review, only: [:show, :edit, :update, :destroy]
  before_action :set_podcast
  before_action :signed_in_user, only: [:new]
  
  def index
    @podcast = Podcast.find(params[:podcast_id])
    @podcast_reviews = PodcastReview.all
  end

  def show
    @podcast = Podcast.find(params[:podcast_id])
  end

  def new
    @podcast = Podcast.find(params[:podcast_id])
    @podcast_review = PodcastReview.new 
  end

  def edit
    @podcast = Podcast.find(params[:podcast_id])
  end

  def create
    @podcast = Podcast.find(params[:podcast_id])
    @podcast_review = @podcast.podcast_reviews.build(podcast_review_params)
    @podcast_review.user = current_user

    respond_to do |format|
      if @podcast_review.save
        format.html { redirect_to [@podcast, @podcast_review], notice: 'Podcast review was successfully created.' }
        format.json { render action: 'index', status: :created, location: @podcast_review }
      else
        format.html { render action: 'new' }
        format.json { render json: @podcast_review.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @podcast = Podcast.find(params[:podcast_id])
    @podcast_review = @podcast.podcast_reviews.build(podcast_review_params)
    @podcast_review.user = current_user
    
    respond_to do |format|
      if @podcast_review.update(podcast_review_params)
        format.html { redirect_to [@podcast, @podcast_review], notice: 'Podcast review was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @podcast_review.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @podcast_review.destroy
    respond_to do |format|
      format.html { redirect_to podcast_reviews_url }
      format.json { head :no_content }
    end
  end

   
  private
  
    def set_podcast
      @podcast = Podcast.find(params[:podcast_id])
    end

    def set_podcast_review
      @podcast_review = PodcastReview.find(params[:id])
    end

    def podcast_review_params
      params.require(:podcast_review).permit(:title, :content, :podcast_id, :user_id)
    end

end
