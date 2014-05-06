require 'test_helper'

class PodcastReviewsControllerTest < ActionController::TestCase
  setup do
    @podcast_review = podcast_reviews(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:podcast_reviews)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create podcast_review" do
    assert_difference('PodcastReview.count') do
      post :create, podcast_review: { content: @podcast_review.content, podcast_id: @podcast_review.podcast_id, title: @podcast_review.title, user_id: @podcast_review.user_id }
    end

    assert_redirected_to podcast_review_path(assigns(:podcast_review))
  end

  test "should show podcast_review" do
    get :show, id: @podcast_review
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @podcast_review
    assert_response :success
  end

  test "should update podcast_review" do
    patch :update, id: @podcast_review, podcast_review: { content: @podcast_review.content, podcast_id: @podcast_review.podcast_id, title: @podcast_review.title, user_id: @podcast_review.user_id }
    assert_redirected_to podcast_review_path(assigns(:podcast_review))
  end

  test "should destroy podcast_review" do
    assert_difference('PodcastReview.count', -1) do
      delete :destroy, id: @podcast_review
    end

    assert_redirected_to podcast_reviews_path
  end
end
