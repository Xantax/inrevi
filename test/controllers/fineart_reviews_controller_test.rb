require 'test_helper'

class FineartReviewsControllerTest < ActionController::TestCase
  setup do
    @fineart_review = fineart_reviews(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fineart_reviews)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fineart_review" do
    assert_difference('FineartReview.count') do
      post :create, fineart_review: { content: @fineart_review.content, fineart_id: @fineart_review.fineart_id, user_id: @fineart_review.user_id }
    end

    assert_redirected_to fineart_review_path(assigns(:fineart_review))
  end

  test "should show fineart_review" do
    get :show, id: @fineart_review
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fineart_review
    assert_response :success
  end

  test "should update fineart_review" do
    patch :update, id: @fineart_review, fineart_review: { content: @fineart_review.content, fineart_id: @fineart_review.fineart_id, user_id: @fineart_review.user_id }
    assert_redirected_to fineart_review_path(assigns(:fineart_review))
  end

  test "should destroy fineart_review" do
    assert_difference('FineartReview.count', -1) do
      delete :destroy, id: @fineart_review
    end

    assert_redirected_to fineart_reviews_path
  end
end
