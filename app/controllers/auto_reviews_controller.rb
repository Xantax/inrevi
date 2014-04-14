class AutoReviewsController < ApplicationController
  before_action :set_auto_review, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_action :set_auto, only: [:index, :show, :new, :create, :edit, :update, :destroy, :upvote, :downvote]
  before_action :signed_in_user, only: [:new]

  def index
    @auto_reviews = @auto.auto_reviews.order("cached_votes_score DESC")
  end

  def show
  end

  def new
    @auto_review = AutoReview.new
  end

  def edit
  end

  def create
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
    @auto_review = @auto.auto_reviews.find(params[:id])
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
    render "update_likes"
  end

  def downvote
    @auto_review.downvote_from current_user
    render "update_likes"
  end 

  private
    
    def set_auto
      @auto = Auto.find(params[:auto_id])
    end
  
    def set_auto_review
      @auto_review = AutoReview.find(params[:id])
    end

    def auto_review_params
      params.require(:auto_review).permit(:title, :content, :auto_id, :user_id, :point, :score)
    end
  
end
