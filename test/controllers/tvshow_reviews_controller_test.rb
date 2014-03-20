require 'test_helper'

class TvshowReviewsControllerTest < ActionController::TestCase
  setup do
    @tvshow_review = tvshow_reviews(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tvshow_reviews)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tvshow_review" do
    assert_difference('TvshowReview.count') do
      post :create, tvshow_review: { content: @tvshow_review.content, title: @tvshow_review.title, tvshow_id: @tvshow_review.tvshow_id, user_id: @tvshow_review.user_id }
    end

    assert_redirected_to tvshow_review_path(assigns(:tvshow_review))
  end

  test "should show tvshow_review" do
    get :show, id: @tvshow_review
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tvshow_review
    assert_response :success
  end

  test "should update tvshow_review" do
    patch :update, id: @tvshow_review, tvshow_review: { content: @tvshow_review.content, title: @tvshow_review.title, tvshow_id: @tvshow_review.tvshow_id, user_id: @tvshow_review.user_id }
    assert_redirected_to tvshow_review_path(assigns(:tvshow_review))
  end

  test "should destroy tvshow_review" do
    assert_difference('TvshowReview.count', -1) do
      delete :destroy, id: @tvshow_review
    end

    assert_redirected_to tvshow_reviews_path
  end
end
