require 'test_helper'

class CheckRecordsControllerTest < ActionController::TestCase
  setup do
    @check_record = check_records(:big_check)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:check_records)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create check_record" do
    assert_difference('CheckRecord.count') do
      post :create, check_record: { date: @check_record.date, device_plan_id: @check_record.device_plan_id, engineer_id: @check_record.engineer_id, note: @check_record.note, time_usage: @check_record.time_usage }
    end

    assert_redirected_to check_record_path(assigns(:check_record))
  end

  test "should show check_record" do
    get :show, id: @check_record
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @check_record
    assert_response :success
  end

  test "should update check_record" do
    patch :update, id: @check_record, check_record: { date: @check_record.date, device_plan_id: @check_record.device_plan_id, engineer_id: @check_record.engineer_id, note: @check_record.note, time_usage: @check_record.time_usage }
    assert_redirected_to check_record_path(assigns(:check_record))
  end

  test "should destroy check_record" do
    assert_difference('CheckRecord.count', -1) do
      delete :destroy, id: @check_record
    end

    assert_redirected_to check_records_path
  end
end
