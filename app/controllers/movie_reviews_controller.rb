class MovieReviewsController < ApplicationController
  before_action :set_movie_review, only: [:destroy, :upvote, :downvote]
  before_action :set_movie, [:new, :create]
  
  require 'themoviedb'

  before_filter :set_config
  Tmdb::Api.key(Settings.tmdb.key)

  def set_config
  	@configuration = Tmdb::Configuration.new
  end

  def all
    @movie_reviews = MovieReview.paginate(:page => params[:page], :per_page => 10).order("cached_votes_score ASC")
    render 'index'
  end
  
  def index
    @movie_reviews = MovieReview.where(movie_id: params[:id]).paginate(:page => params[:page], :per_page => 10).order("cached_votes_score DESC")
  end

  def show
    
  end

  def new
    @movie_review = MovieReview.new
    @movie_review.review_images.build
    @movie_review.review_images.build  
    @movie_review.review_images.build  
  end

  def edit
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

  def update
      if @movie_review.update(movie_review_params)
        redirect_to @movie_review, notice: 'Movie review was successfully updated.'
      else
        render action: 'edit'
      end
  end

  def destroy
    @movie_review.destroy
      redirect_to root_path
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
end
