require 'test_helper'

class LocalReviewsControllerTest < ActionController::TestCase
  setup do
    @local_review = local_reviews(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:local_reviews)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create local_review" do
    assert_difference('LocalReview.count') do
      post :create, local_review: { content: @local_review.content, local_id: @local_review.local_id, title: @local_review.title, user_id: @local_review.user_id }
    end

    assert_redirected_to local_review_path(assigns(:local_review))
  end

  test "should show local_review" do
    get :show, id: @local_review
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @local_review
    assert_response :success
  end

  test "should update local_review" do
    patch :update, id: @local_review, local_review: { content: @local_review.content, local_id: @local_review.local_id, title: @local_review.title, user_id: @local_review.user_id }
    assert_redirected_to local_review_path(assigns(:local_review))
  end

  test "should destroy local_review" do
    assert_difference('LocalReview.count', -1) do
      delete :destroy, id: @local_review
    end

    assert_redirected_to local_reviews_path
  end
end
