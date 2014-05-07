require 'test_helper'

class BookReviewsControllerTest < ActionController::TestCase
  setup do
    @book_review = book_reviews(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:book_reviews)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create book_review" do
    assert_difference('BookReview.count') do
      post :create, book_review: { content: @book_review.content, title: @book_review.title, user_id: @book_review.user_id }
    end

    assert_redirected_to book_review_path(assigns(:book_review))
  end

  test "should show book_review" do
    get :show, id: @book_review
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @book_review
    assert_response :success
  end

  test "should update book_review" do
    patch :update, id: @book_review, book_review: { content: @book_review.content, title: @book_review.title, user_id: @book_review.user_id }
    assert_redirected_to book_review_path(assigns(:book_review))
  end

  test "should destroy book_review" do
    assert_difference('BookReview.count', -1) do
      delete :destroy, id: @book_review
    end

    assert_redirected_to book_reviews_path
  end
end
