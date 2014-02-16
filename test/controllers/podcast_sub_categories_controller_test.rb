require 'test_helper'

class PodcastSubCategoriesControllerTest < ActionController::TestCase
  setup do
    @podcast_sub_category = podcast_sub_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:podcast_sub_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create podcast_sub_category" do
    assert_difference('PodcastSubCategory.count') do
      post :create, podcast_sub_category: { podcastcategory_id: @podcast_sub_category.podcastcategory_id }
    end

    assert_redirected_to podcast_sub_category_path(assigns(:podcast_sub_category))
  end

  test "should show podcast_sub_category" do
    get :show, id: @podcast_sub_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @podcast_sub_category
    assert_response :success
  end

  test "should update podcast_sub_category" do
    patch :update, id: @podcast_sub_category, podcast_sub_category: { podcastcategory_id: @podcast_sub_category.podcastcategory_id }
    assert_redirected_to podcast_sub_category_path(assigns(:podcast_sub_category))
  end

  test "should destroy podcast_sub_category" do
    assert_difference('PodcastSubCategory.count', -1) do
      delete :destroy, id: @podcast_sub_category
    end

    assert_redirected_to podcast_sub_categories_path
  end
end
