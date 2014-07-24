class TvshowReviewsController < ApplicationController
  before_action :set_tvshow_review, only: [:destroy, :upvote, :downvote]
  before_action :set_tvshow, [:new, :create]
  before_action :signed_in_user
  before_action :require_permission, only: :destroy
  before_action :only_admin, only: :all

  def all
      @tvshow_reviews = TvshowReview.paginate(:page => params[:page], :per_page => 15).order("cached_votes_score ASC")
      render 'index'
  end
  
  def index
    @tvshow_reviews = TvshowReview.where(tvshow_id: params[:id]).paginate(:page => params[:page], :per_page => 15).order("cached_votes_score DESC")
  end

  def new
    @tvshow_review = TvshowReview.new
    @tvshow_review.review_images.build 
    @tvshow_review.review_images.build
    @tvshow_review.review_images.build
  end

  def create
    @tvshow_review = TvshowReview.new(tvshow_review_params)
    @tvshow_review.user = current_user

      if @tvshow_review.save
        @tvshow_review.create_activity :create, owner: current_user
        
        redirect_to current_user
      else
        render action: 'new'
      end
  end

  def destroy
    @tvshow_review.destroy
      redirect_to current_user
  end
  
  def upvote
   @tvshow_review.liked_by current_user
   render nothing: true
  end

  def downvote
    @tvshow_review.downvote_from current_user
    render nothing: true    
  end

  private
  
    def set_tvshow
      @tvshow = Tmdb::TV.detail(params[:tvshow_id])
    end  

    def set_tvshow_review
      @tvshow_review = TvshowReview.find(params[:id])
    end

    def tvshow_review_params
      params.require(:tvshow_review).permit(:content, :user_id, :point, :score,
        :tvshow_id, :tvshow_name, :tvshow_year, :tvshow_poster, 
        review_images_attributes: [:image, :attachable_id, :attachable_type])
    end
  
    def require_permission
      if current_user != TvshowReview.find(params[:id]).user
        redirect_to root_path
      end
    end  
    
    def only_admin
      unless current_user.admin?
        redirect_to root_path
      end
    end 
  
end
