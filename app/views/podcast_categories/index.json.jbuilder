json.array!(@podcast_categories) do |podcast_category|
  json.extract! podcast_category, :id
  json.url podcast_category_url(podcast_category, format: :json)
end
