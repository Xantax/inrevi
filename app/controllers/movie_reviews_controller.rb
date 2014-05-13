class MovieReviewsController < ApplicationController
  before_action :set_movie_review, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_action :set_movie, [:new, :create, :show]
  
  require 'themoviedb'

  before_filter :set_config
  Tmdb::Api.key(Settings.tmdb.key)

  def set_config
  	@configuration = Tmdb::Configuration.new
  end

  def all
    @all_movie_reviews = MovieReview.paginate(:page => params[:page], :per_page => 10).order("cached_votes_score ASC")
  end
  
  def index
    @movie_reviews = MovieReview.where(movie_id: params[:id]).paginate(:page => params[:page], :per_page => 10).order("cached_votes_score DESC")
  end

  def show
  end

  def new
    @movie_review = MovieReview.new
    @movie_review.review_images.build  
  end

  def edit
  end

  def create
    @movie_review = MovieReview.new(movie_review_params)
    @movie_review.user = current_user

    respond_to do |format|
      if @movie_review.save
        @movie_review.create_activity :create, owner: current_user
        
        format.html { redirect_to movie_movie_review_path(@movie.id, @movie_review), notice: 'Thank you. Share your review' }
        format.json { render action: 'show', status: :created, location: @movie_review }
      else
        format.html { render action: 'new' }
        format.json { render json: @movie_review.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @movie_review.update(movie_review_params)
        format.html { redirect_to @movie_review, notice: 'Movie review was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @movie_review.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @movie_review.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { head :no_content }
    end
  end
  
  def upvote
   @movie_review.liked_by current_user
   render nothing: true
  end

  def downvote
    @movie_review.downvote_from current_user
  end

  private

    def set_movie_review
      @movie_review = MovieReview.find(params[:id])
    end
  
    def set_movie
      @movie = Tmdb::Movie.detail(params[:movie_id])
    end

    def movie_review_params
      params.require(:movie_review).permit(:title, :content, :user, :movie_id, :point, :score, :movie_imdb, 
        :movie_title, :movie_year, :movie_runtime, :movie_ident, :movie_poster,
        review_images_attributes: [:image, :attachable_id, :attachable_type])
    end
end
