json.array!(@podcasts) do |podcast|
  json.extract! podcast, :id, :name, :hosts
  json.url podcast_url(podcast, format: :json)
end
