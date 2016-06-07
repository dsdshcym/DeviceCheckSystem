json.array!(@check_plans) do |check_plan|
  json.extract! check_plan, :id, :name, :interval, :remark, :device_type_id
  json.url check_plan_url(check_plan, format: :json)
end
