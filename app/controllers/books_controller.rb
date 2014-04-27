class BooksController < ApplicationController
  
  def index
  end

  def search
    @books = Book.search params
    render 'index'
  end

  def show
    @book = GoogleBooks.retrieve(params[:id])
  end
  
end
