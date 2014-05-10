class BookReviewsController < ApplicationController
  before_action :set_book_review, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_action :set_book, [:new, :create, :show]

  def all
    @all_book_reviews = BookReview.order("cached_votes_score ASC")
  end
  
  def index
    @book_reviews = BookReview.where(book_id: params[:id]).order("cached_votes_score DESC")
  end

  def show
  end

  def new
    @book_review = BookReview.new
    @book_review.review_images.build
  end

  def edit
  end

  def create
    @book_review = BookReview.new(book_review_params)
    @book_review.user = current_user

    respond_to do |format|
      if @book_review.save
        @book_review.create_activity :create, owner: current_user
        
        format.html { redirect_to @book_review, notice: 'Book review was successfully created.' }
        format.json { render action: 'show', status: :created, location: @book_review }
      else
        format.html { render action: 'new' }
        format.json { render json: @book_review.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @book_review.update(book_review_params)
        format.html { redirect_to @book_review, notice: 'Book review was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @book_review.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @book_review.destroy
    respond_to do |format|
      format.html { redirect_to book_reviews_url }
      format.json { head :no_content }
    end
  end
  
  def upvote
   @book_review.liked_by current_user
   render nothing: true
  end

  def downvote
    @book_review.downvote_from current_user
  end

  private

    def set_book_review
      @book_review = BookReview.find(params[:id])
    end
  
    def set_book
      @book = GoogleBooks.retrieve(params[:book_id])
    end

    def book_review_params
      params.require(:book_review).permit(:title, :content, :user_id, :book_id, :point, :score,
        :book_name, :book_authors, :book_pages, :book_image, :book_language, :book_isbn,
        review_images_attributes: [:id, :image, :attachable_id, :attachable_type]
        )
    end
end
