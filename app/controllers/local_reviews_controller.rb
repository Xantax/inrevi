class LocalReviewsController < ApplicationController
  before_action :factual_authorize
  before_action :set_local_review, only: [:show, :destroy, :upvote, :downvote, :index]
  before_action :set_local, only: [:index, :new, :create]
  before_action :signed_in_user
  before_action :require_permission, only: :destroy
  before_action :only_admin, only: :all

  def all
      @local_reviews = LocalReview.paginate(:page => params[:page], :per_page => 15).order("cached_votes_score ASC")
      render 'index'
  end
  
  def index
    @local_reviews = LocalReview.where(local_id: params[:id]).paginate(:page => params[:page], :per_page => 15).order("cached_votes_score DESC")
  end

  def new
    @local_review = LocalReview.new
    @local_review.review_images.build 
    @local_review.review_images.build 
    @local_review.review_images.build 
  end

  def create
    @local_review = LocalReview.new(local_review_params)
    @local_review.user = current_user

      if @local_review.save
        @local_review.create_activity :create, owner: current_user
        
        redirect_to current_user
      else
        render action: 'new'
      end
  end

  def destroy
    @local_review.destroy
      redirect_to current_user
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
      params.require(:local_review).permit(:user_id, :local_id, :content, :point, :score,
        :local_name, :local_address, :local_locality, :local_region, :local_postcode, :local_country, :local_neighborhood, 
        :local_tel, :local_latitude, :local_longitude, :local_category_labels, :local_email,
        review_images_attributes: [:image, :attachable_id, :attachable_type])
    end
  
    def factual_authorize
      @factual = Factual.new(ENV["FACTUAL_KEY"], ENV["FACTUAL_SECRET"])
    end
  
    def require_permission
      if current_user != LocalReview.find(params[:id]).user
        redirect_to root_path
      end
    end 
    
    def only_admin
      unless current_user.admin?
        redirect_to root_path
      end
    end
  
end
