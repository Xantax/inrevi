require 'test_helper'

class SongReviewsControllerTest < ActionController::TestCase
  setup do
    @song_review = song_reviews(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:song_reviews)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create song_review" do
    assert_difference('SongReview.count') do
      post :create, song_review: { content: @song_review.content, song_id: @song_review.song_id, title: @song_review.title, user_id: @song_review.user_id }
    end

    assert_redirected_to song_review_path(assigns(:song_review))
  end

  test "should show song_review" do
    get :show, id: @song_review
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @song_review
    assert_response :success
  end

  test "should update song_review" do
    patch :update, id: @song_review, song_review: { content: @song_review.content, song_id: @song_review.song_id, title: @song_review.title, user_id: @song_review.user_id }
    assert_redirected_to song_review_path(assigns(:song_review))
  end

  test "should destroy song_review" do
    assert_difference('SongReview.count', -1) do
      delete :destroy, id: @song_review
    end

    assert_redirected_to song_reviews_path
  end
end
