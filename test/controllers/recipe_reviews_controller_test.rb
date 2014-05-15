require 'test_helper'

class RecipeReviewsControllerTest < ActionController::TestCase
  setup do
    @recipe_review = recipe_reviews(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:recipe_reviews)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create recipe_review" do
    assert_difference('RecipeReview.count') do
      post :create, recipe_review: { content: @recipe_review.content, recipe_id: @recipe_review.recipe_id, title: @recipe_review.title, user_id: @recipe_review.user_id }
    end

    assert_redirected_to recipe_review_path(assigns(:recipe_review))
  end

  test "should show recipe_review" do
    get :show, id: @recipe_review
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @recipe_review
    assert_response :success
  end

  test "should update recipe_review" do
    patch :update, id: @recipe_review, recipe_review: { content: @recipe_review.content, recipe_id: @recipe_review.recipe_id, title: @recipe_review.title, user_id: @recipe_review.user_id }
    assert_redirected_to recipe_review_path(assigns(:recipe_review))
  end

  test "should destroy recipe_review" do
    assert_difference('RecipeReview.count', -1) do
      delete :destroy, id: @recipe_review
    end

    assert_redirected_to recipe_reviews_path
  end
end
