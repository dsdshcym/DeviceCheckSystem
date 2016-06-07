require 'test_helper'

class DevicePlansControllerTest < ActionController::TestCase
  setup do
    @device_plan = device_plans(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:device_plans)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create device_plan" do
    assert_difference('DevicePlan.count') do
      post :create, device_plan: { check_plan_id: @device_plan.check_plan_id, device_id: @device_plan.device_id, scheduled_date: @device_plan.scheduled_date, status: @device_plan.status }
    end

    assert_redirected_to device_plan_path(assigns(:device_plan))
  end

  test "should show device_plan" do
    get :show, id: @device_plan
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @device_plan
    assert_response :success
  end

  test "should update device_plan" do
    patch :update, id: @device_plan, device_plan: { check_plan_id: @device_plan.check_plan_id, device_id: @device_plan.device_id, scheduled_date: @device_plan.scheduled_date, status: @device_plan.status }
    assert_redirected_to device_plan_path(assigns(:device_plan))
  end

  test "should destroy device_plan" do
    assert_difference('DevicePlan.count', -1) do
      delete :destroy, id: @device_plan
    end

    assert_redirected_to device_plans_path
  end
end
