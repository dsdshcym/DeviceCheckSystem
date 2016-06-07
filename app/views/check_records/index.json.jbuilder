json.array!(@check_records) do |check_record|
  json.extract! check_record, :id, :date, :time_usage, :note, :device_plan_id, :engineer_id
  json.url check_record_url(check_record, format: :json)
end
