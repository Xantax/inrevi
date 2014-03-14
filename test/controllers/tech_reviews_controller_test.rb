require 'test_helper'

class TechReviewsControllerTest < ActionController::TestCase
  setup do
    @tech_review = tech_reviews(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tech_reviews)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tech_review" do
    assert_difference('TechReview.count') do
      post :create, tech_review: { content: @tech_review.content, tech_id: @tech_review.tech_id, title: @tech_review.title, user_id: @tech_review.user_id }
    end

    assert_redirected_to tech_review_path(assigns(:tech_review))
  end

  test "should show tech_review" do
    get :show, id: @tech_review
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tech_review
    assert_response :success
  end

  test "should update tech_review" do
    patch :update, id: @tech_review, tech_review: { content: @tech_review.content, tech_id: @tech_review.tech_id, title: @tech_review.title, user_id: @tech_review.user_id }
    assert_redirected_to tech_review_path(assigns(:tech_review))
  end

  test "should destroy tech_review" do
    assert_difference('TechReview.count', -1) do
      delete :destroy, id: @tech_review
    end

    assert_redirected_to tech_reviews_path
  end
end
