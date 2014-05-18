class FineartReviewsController < ApplicationController
  before_action :set_fineart_review, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_action :set_fineart, only: [:index, :show, :new, :create, :edit]
  
  def all
    @all_fineart_reviews = FineartReview.paginate(:page => params[:page], :per_page => 10).order("cached_votes_score ASC")
  end
  
  def index
    @fineart_reviews = @fineart.fineart_reviews.paginate(:page => params[:page], :per_page => 10).order("cached_votes_score DESC")
    @avg_score = 0
    @avg_score = @fineart_reviews.inject(0) { |sum, r| sum += r.point }.to_f / @fineart_reviews.count if @fineart_reviews.count > 0
  end

  def show
  end

  def new
    @fineart_review = FineartReview.new
    @fineart_review.review_images.build 
    @fineart_review.review_images.build 
    @fineart_review.review_images.build     
  end

  def edit
  end

  def create
    @fineart_review = @fineart.fineart_reviews.build(fineart_review_params)
    @fineart_review.user = current_user

      if @fineart_review.save
        @fineart_review.create_activity :create, owner: current_user
        
        redirect_to [@fineart, @fineart_review], notice: 'Share your review'
      else
        render action: 'new'
      end
  end

  def update
    @fineart_review.review_images.build if @fineart_review.review_images.empty?

      if @fineart_review.update(fineart_review_params)
        redirect_to @fineart_review
      else
        render action: 'edit'
      end
  end

  def destroy
    @fineart_review.destroy
      redirect_to root_path
  end
  
  def upvote
    @fineart_review.liked_by current_user
   render nothing: true
  end

  def downvote
    @fineart_review.downvote_from current_user
    render nothing: true    
  end

  private

  def set_fineart
    @fineart = Fineart.find(params[:fineart_id])
    end
  
  def set_fineart_review
    @fineart = Fineart.find(params[:fineart_id])
    @fineart_review = @fineart.fineart_reviews.find(params[:id])
  end

    def fineart_review_params
      params.require(:fineart_review).permit(:content, :user_id, :fineart_id, :point, :score,
        review_images_attributes: [:image, :attachable_id, :attachable_type])
    end
end
