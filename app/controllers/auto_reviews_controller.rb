class AutoReviewsController < ApplicationController
  before_action :set_auto_review, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_action :set_auto, only: [:index, :show, :new, :create, :edit]
  before_action :signed_in_user, only: [:new, :upvote, :downvote, :edit, :update, :destroy]

  def all
    @all_auto_reviews = AutoReview.published.order("cached_votes_score ASC")
  end
  
  def unpublished
    @all_auto_reviews = AutoReview.unpublished.order("cached_votes_score ASC")
  end
  
  def index
    @auto_reviews = @auto.auto_reviews.published.order("cached_votes_score DESC")
    @avg_score = 0
    @avg_score = @auto_reviews.inject(0) { |sum, r| sum += r.point }.to_f / @auto_reviews.count if @auto_reviews.count > 0
  end

  def show    
  end

  def new
    @auto_review = AutoReview.new
    @auto_review.review_images.build  
  end

  def edit
  end

  def create
    @auto_review = @auto.auto_reviews.build(auto_review_params)
    @auto_review.user = current_user

    respond_to do |format|
      if @auto_review.save
        @auto_review.create_activity :create, owner: current_user
        
        format.html { redirect_to [@auto, @auto_review], notice: 'Auto review was successfully created.' }
        format.json { render action: 'index', status: :created, location: @auto_review }
      else
        format.html { render action: 'new' }
        format.json { render json: @auto_review.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @auto_review = @auto.auto_reviews.find(params[:id])
    @auto_review.review_images.build if @auto_review.review_images.empty?
    @auto_review.user = current_user
    
    respond_to do |format|
      if @auto_review.update(auto_review_params)
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
      format.html { redirect_to auto_path(@auto_review.auto) }
      format.json { head :no_content }
    end
  end
  
  def upvote
   @auto_review.liked_by current_user
   render nothing: true
  end

  def downvote
   @auto_review.downvote_from current_user
  end 

  private
    
    def set_auto
      @auto = Auto.find(params[:auto_id])
    end
  
    def set_auto_review
      @auto = Auto.find(params[:auto_id])
      @auto_review = @auto.auto_reviews.find(params[:id])
    end

    def auto_review_params
      params.require(:auto_review).permit(:title, :content, :auto_id, :user_id, :point, :score, :published, review_images_attributes: [:image, :attachable_id, :attachable_type])
    end
  
end
