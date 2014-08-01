class MovieReviewsController < ApplicationController
  before_action :set_movie_review, only: [:destroy, :upvote, :downvote]
  before_action :set_movie, [:new, :create]
  before_action :signed_in_user
  before_action :require_permission, only: :destroy
  before_action :only_admin, only: :all
  
  def index
    @movie_reviews = MovieReview.where(movie_id: params[:id]).paginate(:page => params[:page], :per_page => 15).order("cached_votes_score DESC")
  end

  def new
    @movie_review = MovieReview.new
    @movie_review.review_images.build
    @movie_review.review_images.build  
    @movie_review.review_images.build  
  end

  def create
    @movie_review = MovieReview.new(movie_review_params)
    @movie_review.user = current_user

      if @movie_review.save
        @movie_review.create_activity :create, owner: current_user
        
        redirect_to current_user
      else
        render action: 'new'
      end
  end

  def destroy
    @movie_review.destroy
      redirect_to current_user
  end
  
  def upvote
   @movie_review.liked_by current_user
   render nothing: true
  end

  def downvote
    @movie_review.downvote_from current_user
    render nothing: true    
  end

  private

    def set_movie_review
      @movie_review = MovieReview.find(params[:id])
    end
  
    def set_movie
      @movie = Tmdb::Movie.detail(params[:movie_id])
    end

    def movie_review_params
      params.require(:movie_review).permit(:content, :user, :movie_id, :point, :score, :movie_imdb, 
        :movie_title, :movie_year, :movie_runtime, :movie_ident, :movie_poster,
        review_images_attributes: [:image, :attachable_id, :attachable_type])
    end
  
    def require_permission
      if current_user != MovieReview.find(params[:id]).user
        redirect_to root_path
      end
    end 
    
    def only_admin
      unless current_user.admin?
        redirect_to root_path
      end
    end 
   
end
