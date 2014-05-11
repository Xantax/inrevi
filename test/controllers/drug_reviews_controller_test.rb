require 'test_helper'

class DrugReviewsControllerTest < ActionController::TestCase
  setup do
    @drug_review = drug_reviews(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:drug_reviews)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create drug_review" do
    assert_difference('DrugReview.count') do
      post :create, drug_review: { content: @drug_review.content, drug_id: @drug_review.drug_id, title: @drug_review.title, user_id: @drug_review.user_id }
    end

    assert_redirected_to drug_review_path(assigns(:drug_review))
  end

  test "should show drug_review" do
    get :show, id: @drug_review
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @drug_review
    assert_response :success
  end

  test "should update drug_review" do
    patch :update, id: @drug_review, drug_review: { content: @drug_review.content, drug_id: @drug_review.drug_id, title: @drug_review.title, user_id: @drug_review.user_id }
    assert_redirected_to drug_review_path(assigns(:drug_review))
  end

  test "should destroy drug_review" do
    assert_difference('DrugReview.count', -1) do
      delete :destroy, id: @drug_review
    end

    assert_redirected_to drug_reviews_path
  end
end
