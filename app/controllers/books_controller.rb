class BooksController < ApplicationController
  before_action :signed_in_user, except: [:show, :index, :search]
  
  def index
  end

  def search
    @books = Book.search params
    render 'index'   
  end

  def show
    @book = GoogleBooks.retrieve(params[:id])    
    @book_reviews = BookReview.where(book_id: params[:id]).paginate(:page => params[:page], :per_page => 15).order("cached_votes_score DESC")    
    @avg_score = 0
    @avg_score = @book_reviews.inject(0) { |sum, r| sum += r.point }.to_f / @book_reviews.count if @book_reviews.count > 0
  end
  
  def description
    @book = GoogleBooks.retrieve(params[:id])
  end
  
end
