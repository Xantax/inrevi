class MoviesController < ApplicationController
  require 'themoviedb'

  before_filter :set_config
  Tmdb::Api.key("a8ddb278788ceab2a58875b7f172c327")

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
    
    @movie_reviews = MovieReview.where(movie_ident: params[:id]).published.order("cached_votes_score DESC")
    
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
