require 'test_helper'

class FineartsControllerTest < ActionController::TestCase
  setup do
    @fineart = finearts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:finearts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fineart" do
    assert_difference('Fineart.count') do
      post :create, fineart: { name: @fineart.name, user_id: @fineart.user_id }
    end

    assert_redirected_to fineart_path(assigns(:fineart))
  end

  test "should show fineart" do
    get :show, id: @fineart
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fineart
    assert_response :success
  end

  test "should update fineart" do
    patch :update, id: @fineart, fineart: { name: @fineart.name, user_id: @fineart.user_id }
    assert_redirected_to fineart_path(assigns(:fineart))
  end

  test "should destroy fineart" do
    assert_difference('Fineart.count', -1) do
      delete :destroy, id: @fineart
    end

    assert_redirected_to finearts_path
  end
end
