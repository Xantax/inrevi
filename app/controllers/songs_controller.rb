class SongsController < ApplicationController
 
  def index
  end

  def search
    @songs = Song.search params
    render 'index'
  end

  def show
    @song = Song.retrieve params[:id]
  end
  
end
