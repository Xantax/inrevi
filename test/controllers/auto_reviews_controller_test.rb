require 'test_helper'

class AutoReviewsControllerTest < ActionController::TestCase
  setup do
    @auto_review = auto_reviews(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:auto_reviews)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create auto_review" do
    assert_difference('AutoReview.count') do
      post :create, auto_review: { auto_id: @auto_review.auto_id, content: @auto_review.content, title: @auto_review.title, user_id: @auto_review.user_id }
    end

    assert_redirected_to auto_review_path(assigns(:auto_review))
  end

  test "should show auto_review" do
    get :show, id: @auto_review
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @auto_review
    assert_response :success
  end

  test "should update auto_review" do
    patch :update, id: @auto_review, auto_review: { auto_id: @auto_review.auto_id, content: @auto_review.content, title: @auto_review.title, user_id: @auto_review.user_id }
    assert_redirected_to auto_review_path(assigns(:auto_review))
  end

  test "should destroy auto_review" do
    assert_difference('AutoReview.count', -1) do
      delete :destroy, id: @auto_review
    end

    assert_redirected_to auto_reviews_path
  end
end
