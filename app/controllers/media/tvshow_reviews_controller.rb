class Media::TvshowReviewsController < ApplicationController
  before_action :set_tvshow_review, only: [:show, :edit, :update, :destroy]
  before_action :set_tvshow
  before_action :signed_in_user, only: [:new]

  def index
    @tvshow_reviews = Media::TvshowReview.where(tvshow_id: params[:id])
  end

  def show
  end

  def new
    @tvshow_review = Media::TvshowReview.new
  end

  def edit
  end

  def create
    @tvshow_review = Media::TvshowReview.new(tvshow_review_params)
    @tvshow_review.user = current_user

    respond_to do |format|
      if @tvshow_review.save
        format.html { redirect_to tvshow_path(@tvshow.id), notice: 'Tvshow review was successfully created.' }
        format.json { render action: 'show', status: :created, location: @tvshow_review }
      else
        format.html { render action: 'new' }
        format.json { render json: @tvshow_review.errors, status: :unprocessable_entity }
      end
    end
  end

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

  def destroy
    @tvshow_review.destroy
    respond_to do |format|
      format.html { redirect_to tvshow_reviews_url }
      format.json { head :no_content }
    end
  end

  private
  
    def set_tvshow
      @tvshow = Tmdb::TV.detail(params[:tvshow_id])
    end

    def set_tvshow_review
      @tvshow_review = Media::TvshowReview.find(params[:id])
    end

    def tvshow_review_params
      params.require(:tvshow_review).permit(:tvshow_id, :user_id, :title, :content)
    end
end
