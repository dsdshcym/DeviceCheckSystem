json.array!(@device_plans) do |device_plan|
  json.extract! device_plan, :id, :scheduled_date, :status, :device_id, :check_plan_id
  json.url device_plan_url(device_plan, format: :json)
end
