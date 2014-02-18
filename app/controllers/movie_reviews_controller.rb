class MovieReviewsController < ApplicationController
  before_action :set_movie_review, only: [:show, :edit, :update, :destroy]
  before_action :set_movie
  # GET /movie_reviews
  # GET /movie_reviews.json
  def index
    @movie_reviews = MovieReview.all
  end

  # GET /movie_reviews/1
  # GET /movie_reviews/1.json
  def show
  end

  # GET /movie_reviews/new
  def new
    @movie = Tmdb::Movie.detail(params[:movie_id])
    @movie_review = MovieReview.new
  end

  # GET /movie_reviews/1/edit
  def edit
  end

  # POST /movie_reviews
  # POST /movie_reviews.json
  def create
    
    @movie = Tmdb::Movie.detail(params[:movie_id])
    @movie_review = MovieReview.new(movie_review_params)

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

  # PATCH/PUT /movie_reviews/1
  # PATCH/PUT /movie_reviews/1.json
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

  # DELETE /movie_reviews/1
  # DELETE /movie_reviews/1.json
  def destroy
    @movie_review.destroy
    respond_to do |format|
      format.html { redirect_to movie_reviews_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie_review
      @movie_review = MovieReview.find(params[:id])
    end
  
  def set_movie
    @movie = Tmdb::Movie.find(params[:movie_id])
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movie_review_params
      params.require(:movie_review).permit(:title, :content, :movie_id)
    end
end