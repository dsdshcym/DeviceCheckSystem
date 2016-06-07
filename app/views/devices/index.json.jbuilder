json.array!(@devices) do |device|
  json.extract! device, :id, :name, :model, :location, :device_type_id
  json.url device_url(device, format: :json)
end
