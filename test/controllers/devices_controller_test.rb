require 'test_helper'

class DevicesControllerTest < ActionController::TestCase
  setup do
    @device = devices(:aux)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:devices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create device" do
    assert_difference('Device.count') do
      post :create, device: { device_type_id: @device.device_type_id, location: @device.location, model: @device.model, name: @device.name }
    end

    assert_redirected_to device_path(assigns(:device))
  end

  test "should show device" do
    get :show, id: @device
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @device
    assert_response :success
  end

  test "should update device" do
    patch :update, id: @device, device: { device_type_id: @device.device_type_id, location: @device.location, model: @device.model, name: @device.name }
    assert_redirected_to device_path(assigns(:device))
  end

  test "should destroy device" do
    assert_difference('Device.count', -1) do
      delete :destroy, id: @device
    end

    assert_redirected_to devices_path
  end

  test "should generate device plans" do
    check_plans = @device.check_plans
    plans_to_add = check_plans.map { |p| 365 / p.interval }.inject(&:+)
    assert_difference('DevicePlan.count', plans_to_add) do
      post :generate, id: @device, span: 365
    end
  end
end
