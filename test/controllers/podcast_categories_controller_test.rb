require 'test_helper'

class PodcastCategoriesControllerTest < ActionController::TestCase
  setup do
    @podcast_category = podcast_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:podcast_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create podcast_category" do
    assert_difference('PodcastCategory.count') do
      post :create, podcast_category: {  }
    end

    assert_redirected_to podcast_category_path(assigns(:podcast_category))
  end

  test "should show podcast_category" do
    get :show, id: @podcast_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @podcast_category
    assert_response :success
  end

  test "should update podcast_category" do
    patch :update, id: @podcast_category, podcast_category: {  }
    assert_redirected_to podcast_category_path(assigns(:podcast_category))
  end

  test "should destroy podcast_category" do
    assert_difference('PodcastCategory.count', -1) do
      delete :destroy, id: @podcast_category
    end

    assert_redirected_to podcast_categories_path
  end
end
