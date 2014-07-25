class MoviesController < ApplicationController
  before_action :signed_in_user, except: [:show]
  
  require 'themoviedb'

  before_filter :set_config
  Tmdb::Api.key(ENV["TMDB_KEY"])

  def set_config
  	@configuration = Tmdb::Configuration.new
  end
  
  def index
  	@now_playing = Tmdb::Movie.now_playing
  end
  
  def show
  	@movie = Tmdb::Movie.detail(params[:id])
  	@images = Tmdb::Movie.images(params[:id])
  	@cast = Tmdb::Movie.casts(params[:id])
  	@trailers = Tmdb::Movie.trailers(params[:id])
  	@similar_movies = Tmdb::Movie.similar_movies(params[:id])
    @crew = Tmdb::Movie.crew(params[:id])
    
    @movie_reviews = MovieReview.where(movie_id: params[:id]).paginate(:page => params[:page], :per_page => 10).order("cached_votes_score DESC")
    
    @avg_score = 0
    @avg_score = @movie_reviews.inject(0) { |sum, r| sum += r.point }.to_f / @movie_reviews.count if @movie_reviews.count > 0
  end
  
  def search
    @movie = Tmdb::Movie.find(params[:query])
  end
  
  def popular
    @popular = Tmdb::Movie.popular
  end
  
end
