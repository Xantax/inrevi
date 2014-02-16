json.array!(@podcast_sub_categories) do |podcast_sub_category|
  json.extract! podcast_sub_category, :id, :podcastcategory_id
  json.url podcast_sub_category_url(podcast_sub_category, format: :json)
end
