require 'test_helper'

class CheckPlansControllerTest < ActionController::TestCase
  setup do
    @check_plan = check_plans(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:check_plans)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create check_plan" do
    assert_difference('CheckPlan.count') do
      post :create, check_plan: { device_type_id: @check_plan.device_type_id, interval: @check_plan.interval, name: @check_plan.name, remark: @check_plan.remark }
    end

    assert_redirected_to check_plan_path(assigns(:check_plan))
  end

  test "should show check_plan" do
    get :show, id: @check_plan
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @check_plan
    assert_response :success
  end

  test "should update check_plan" do
    patch :update, id: @check_plan, check_plan: { device_type_id: @check_plan.device_type_id, interval: @check_plan.interval, name: @check_plan.name, remark: @check_plan.remark }
    assert_redirected_to check_plan_path(assigns(:check_plan))
  end

  test "should destroy check_plan" do
    assert_difference('CheckPlan.count', -1) do
      delete :destroy, id: @check_plan
    end

    assert_redirected_to check_plans_path
  end
end
