class TvshowReviewsController < ApplicationController
  before_action :set_tvshow_review, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_action :set_tvshow

  def all
    @all_tvshow_reviews = TvshowReview.order("cached_votes_score ASC")
  end
  
  def index
    @tvshow_reviews = TvshowReview.where(tvshow_id: params[:id]).order("cached_votes_score DESC")
  end

  def show
  end

  def new
    @tvshow_review = TvshowReview.new
    @tvshow_review.review_images.build  
  end

  def edit
  end

  def create
    @tvshow_review = TvshowReview.new(tvshow_review_params)
    @tvshow_review.user = current_user

    respond_to do |format|
      if @tvshow_review.save
        @tvshow_review.create_activity :create, owner: current_user
        
        format.html { redirect_to tvshow_tvshow_review_path(@tvshow.id, @tvshow_review), notice: 'Thank you. Share your review' }
        format.json { render action: 'show', status: :created, location: @tvshow_review }
      else
        format.html { render action: 'new' }
        format.json { render json: @tvshow_review.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @tvshow_review.review_images.build if @tvshow_review.review_images.empty?
    
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
      format.html { redirect_to root_path }
      format.json { head :no_content }
    end
  end
  
  def upvote
   @tvshow_review.liked_by current_user
   render nothing: true
  end

  def downvote
    @tvshow_review.downvote_from current_user
  end

  private
  
    def set_tvshow
      @tvshow = Tmdb::TV.detail(params[:tvshow_id])
    end  

    def set_tvshow_review
      @tvshow_review = TvshowReview.find(params[:id])
    end

    def tvshow_review_params
      params.require(:tvshow_review).permit(:title, :content, :user_id, :point, :score,
        :tvshow_id, :tvshow_name, :tvshow_year, :tvshow_poster, 
        review_images_attributes: [:image, :attachable_id, :attachable_type])
    end
end
