class BookReviewsController < ApplicationController
  before_action :set_book_review, only: [:show, :destroy, :upvote, :downvote]
  before_action :set_book, [:new, :create]
  before_action :signed_in_user

  def all
    if current_user.admin?
      @book_reviews = BookReview.paginate(:page => params[:page], :per_page => 15).order("cached_votes_score ASC")
      render 'index'
    end
  end
  
  def index
    @book_reviews = BookReview.paginate(:page => params[:page], :per_page => 15).order("cached_votes_score ASC")
  end

  def new
    @book_review = BookReview.new
    @book_review.review_images.build
    @book_review.review_images.build
    @book_review.review_images.build
  end

  def create
    @book_review = BookReview.new(book_review_params)
    @book_review.user = current_user

      if @book_review.save
        @book_review.create_activity :create, owner: current_user
        
        redirect_to current_user
      else
        render action: 'new'
      end
  end

  def update
      if @book_review.update(book_review_params)
        redirect_to book_book_review_path(@book.id, @book_review), notice: 'Book review was successfully updated.'
      else
        render action: 'edit'
      end
  end

  def destroy
    @book_review.destroy
    redirect_to root_path
  end
  
  def upvote
   @book_review.liked_by current_user
   render nothing: true
  end

  def downvote
    @book_review.downvote_from current_user
    render nothing: true    
  end

  private

    def set_book_review
      @book_review = BookReview.find(params[:id])
    end
  
    def set_book
      @book = GoogleBooks.retrieve(params[:book_id])
    end

    def book_review_params
      params.require(:book_review).permit(:content, :user_id, :book_id, :point, :score, :isbn_10, :isbn_13, :book_date,
        :book_name, :book_authors, :book_pages, :book_image, :book_language,
        review_images_attributes: [:image, :attachable_id, :attachable_type]
        )
    end
end
