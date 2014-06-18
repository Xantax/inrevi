json.array!(@alerts) do |alert|
  json.extract! alert, :id, :user_id, :content
  json.url alert_url(alert, format: :json)
end
