class Media::BooksController < ApplicationController
  include BooksHelper
  
  def index
    @books = []
  end

  def search
    @books, @total = Book.search params

    render 'index'
  end

  def show
    @book = Openlibrary::Client.new.book(params[:id])
  end
  
end
