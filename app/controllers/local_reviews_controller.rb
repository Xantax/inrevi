class LocalReviewsController < ApplicationController
  before_action :factual_authorize
  before_action :set_local_review, only: [:show, :edit, :update, :destroy, :upvote, :downvote, :index]
  before_action :set_local, only: [:index, :new, :create, :edit]

  def all
    @all_local_reviews = LocalReview.paginate(:page => params[:page], :per_page => 10).order("cached_votes_score ASC")
  end
  
  def index
    @local_reviews = LocalReview.where(local_id: params[:id]).order("cached_votes_score DESC")
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

      if @local_review.save
        @local_review.create_activity :create, owner: current_user
        
        redirect_to local_local_review_path(@local['factual_id'], @local_review), notice: 'Share your review'
      else
        render action: 'new'
      end
  end

  def update
    @local_review.review_images.build if @local_review.review_images.empty?

      if @local_review.update(local_review_params)
        redirect_to root_path, notice: 'Local review was successfully updated.'
      else
        render action: 'edit'
      end
  end

  def destroy
    @local_review.destroy
      redirect_to root_path
  end

  def upvote
   @local_review.liked_by current_user
   render nothing: true
  end

  def downvote
   @local_review.downvote_from current_user
   render nothing: true   
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
      params.require(:local_review).permit(:user_id, :local_id, :title, :content, :point, :score,
        :local_name, :local_address, :local_locality, :local_region, :local_postcode, :local_country, :local_neighborhood, 
        :local_tel, :local_latitude, :local_longitude, :local_category_labels, :local_email,
        review_images_attributes: [:image, :attachable_id, :attachable_type])
    end
  
    def factual_authorize
      @factual = Factual.new(Settings.factual.key, Settings.factual.secret)
    end
  
end
