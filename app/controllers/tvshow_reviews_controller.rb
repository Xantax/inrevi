class TvshowReviewsController < ApplicationController
  before_action :set_tvshow_review, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_action :set_tvshow

  def all
    @all_tvshow_reviews = TvshowReview.paginate(:page => params[:page], :per_page => 10).order("cached_votes_score ASC")
  end
  
  def index
    @tvshow_reviews = TvshowReview.where(tvshow_id: params[:id]).paginate(:page => params[:page], :per_page => 10).order("cached_votes_score DESC")
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
        
        redirect_to tvshow_tvshow_review_path(@tvshow.id, @tvshow_review), notice: 'Share your review'
      else
        render action: 'new'
      end
    end
  end

  def update
    @tvshow_review.review_images.build if @tvshow_review.review_images.empty?

      if @tvshow_review.update(tvshow_review_params)
        redirect_to @tvshow_review
      else
        render action: 'edit'
      end
    end
  end

  def destroy
    @tvshow_review.destroy
      redirect_to root_path
    end
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
      params.require(:tvshow_review).permit(:title, :content, :user_id, :point, :score,
        :tvshow_id, :tvshow_name, :tvshow_year, :tvshow_poster, 
        review_images_attributes: [:image, :attachable_id, :attachable_type])
    end
end
