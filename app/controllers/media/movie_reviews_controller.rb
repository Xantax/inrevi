class Media::MovieReviewsController < ApplicationController
  before_action :set_movie_review, only: [:show, :edit, :update, :destroy]
  before_action :set_movie
  before_action :signed_in_user, only: [:new]

  def index
    @movie_reviews = MovieReview.where(movie_id: params[:id])
  end

  def show
    @movie_reviews = MovieReview.all
  end

  def new
    @movie = Tmdb::Movie.detail(params[:movie_id])
    @movie_review = MovieReview.new
  end

  def edit
  end

  def create
    
    @movie = Tmdb::Movie.detail(params[:movie_id])
    @movie_review = MovieReview.new(movie_review_params)
    @movie_review.user = current_user

    respond_to do |format|
      if @movie_review.save
        format.html { redirect_to movie_path(@movie.id), notice: 'Movie review was successfully created.' }
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
      format.html { redirect_to movie_reviews_url }
      format.json { head :no_content }
    end
  end

  private

    def set_movie_review
      @movie_review = MovieReview.find(params[:id])
    end
  
    def set_movie
      @movie = Tmdb::Movie.detail(params[:movie_id])
      @now_playing = Tmdb::Movie.now_playing
    end

    def movie_review_params
      params.require(:movie_review).permit(:title, :content, :movie_id, :now_playing_id, :user_id)
    end
  
end