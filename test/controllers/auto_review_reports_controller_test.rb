require 'test_helper'

class AutoReviewReportsControllerTest < ActionController::TestCase
  setup do
    @auto_review_report = auto_review_reports(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:auto_review_reports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create auto_review_report" do
    assert_difference('AutoReviewReport.count') do
      post :create, auto_review_report: { auto_review_id: @auto_review_report.auto_review_id, content: @auto_review_report.content, user_id: @auto_review_report.user_id }
    end

    assert_redirected_to auto_review_report_path(assigns(:auto_review_report))
  end

  test "should show auto_review_report" do
    get :show, id: @auto_review_report
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @auto_review_report
    assert_response :success
  end

  test "should update auto_review_report" do
    patch :update, id: @auto_review_report, auto_review_report: { auto_review_id: @auto_review_report.auto_review_id, content: @auto_review_report.content, user_id: @auto_review_report.user_id }
    assert_redirected_to auto_review_report_path(assigns(:auto_review_report))
  end

  test "should destroy auto_review_report" do
    assert_difference('AutoReviewReport.count', -1) do
      delete :destroy, id: @auto_review_report
    end

    assert_redirected_to auto_review_reports_path
  end
end
