require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get advertising" do
    get :advertising
    assert_response :success
  end

  test "should get faq" do
    get :faq
    assert_response :success
  end

end
