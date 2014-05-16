json.array!(@finearts) do |fineart|
  json.extract! fineart, :id, :name, :user_id
  json.url fineart_url(fineart, format: :json)
end
