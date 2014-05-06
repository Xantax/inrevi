class LocalReviewsController < ApplicationController
  before_action :factual_authorize
  before_action :set_local_review, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_action :set_local, only: [:index, :show, :new, :create, :edit]

  def all
    @all_local_reviews = LocalReview.published.order("cached_votes_score ASC")
  end
  
  def unpublished
    @all_local_reviews = LocalReview.unpublished.order("cached_votes_score ASC")
  end
  
  def index
    @local_reviews = LocalReview.where(local_id: params[:id]).published.order("cached_votes_score DESC")
    @avg_score = 0
    @avg_score = @local_reviews.inject(0) { |sum, r| sum += r.point }.to_f / @local_reviews.count if @local_reviews.count > 0
  end

  def show
  end

  def new
    @local_review = LocalReview.new
    @local_review.review_images.build 
  end

  def edit
  end

  def create
    @local_review = LocalReview.new(local_review_params)
    @local_review.user = current_user

    respond_to do |format|
      if @local_review.save
        @local_review.create_activity :create, owner: current_user
        
        format.html { redirect_to @local_review, notice: 'Local review was successfully created.' }
        format.json { render action: 'show', status: :created, location: @local_review }
      else
        format.html { render action: 'new' }
        format.json { render json: @local_review.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @local_review.review_images.build if @local_review.review_images.empty?
    @local_review.user = current_user
    
    respond_to do |format|
      if @local_review.update(local_review_params)
        format.html { redirect_to @local_review, notice: 'Local review was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @local_review.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @local_review.destroy
    respond_to do |format|
      format.html { redirect_to local_reviews_url }
      format.json { head :no_content }
    end
  end

  def upvote
   @local_review.liked_by current_user
   render nothing: true
  end

  def downvote
   @local_review.downvote_from current_user
  end
  
  private
  
    def set_local
      query = @factual.table('places')
      @local = query.filters('factual_id' => params[:local_id]).first
    end

    def set_local_review
      @local_review = LocalReview.find(params[:id])
    end

    def local_review_params
      params.require(:local_review).permit(:user_id, :local_id, :title, :content, :point, :score, :published, 
        :local_factual, :local_name, :local_address, :local_locality, :local_region, :local_postcode, :local_country, :local_neighborhood, 
        :local_tel, :local_latitude, :local_longitude, :local_category_labels, :local_email,
        review_images_attributes: [:image, :attachable_id, :attachable_type])
    end
  
    def factual_authorize
      @factual = Factual.new("eXMwUZMBIrfW7ORstKjqxoZelkYRMmOwi6C7lRDt", "htInMeU5AXUHdPuErx27W1MIj9MYeYzsG6DhhSV6")
    end
  
end
