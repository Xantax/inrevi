class BooksController < ApplicationController
  
  def index
  end

  def search
    @books = Book.search params
    render 'index'
  end

  def show
    @book = GoogleBooks.search(params[:id]).first
  end
  
end
