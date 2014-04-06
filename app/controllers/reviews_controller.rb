class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user, only: [:new, :edit]
  before_action :correct_user,   only: :destroy
  before_filter :load_reviewable

  def index
    @reviewable = load_reviewable
    @reviews = @reviewable.reviews
  end

  def show
  end

  def edit
    @review = @reviewable.reviews.find(params[:id])
  end

  def new
    query = @factual.table('places')
    @local = query.filters('factual_id' => params[:local_id]).first
    
    
    @reviewable = load_reviewable
    @review = @reviewable.reviews.new
    
  end

  def create
    @review = @reviewable.reviews.new(review_params)
    @review.user = current_user
    
    if @review.save
      redirect_to root_path, notice: "Review created."
    else
      render :new
    end
  end

  def update
    @review = @reviewable.reviews.find(params[:id])
    @review.user = current_user
    
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to reviews_url }
      format.json { head :no_content }
    end
  end

  private
  
    def correct_user
      @review = current_user.reviews.find_by(id: params[:id])
      redirect_to root_url if @review.nil?
    end
  
  def load_reviewable
    resource, id = request.path.split('/')[1, 2]
    @reviewable = resource.singularize.classify.constantize.find(id) 
  end

    def set_review
      @review = Review.find(params[:id])
    end

    def review_params
      params.require(:review).permit(:title, :content, :reviewable_id, :reviewable_type, :user_id)
    end
  
end
