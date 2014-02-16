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
  end
  
  def search
    @movie = Tmdb::Movie.find(params[:query])
  end
  
  def popular
    @popular = Tmdb::Movie.popular
  end
  
end
