json.array!(@reviews) do |review|
  json.extract! review, :id, :title, :content, :reviewable_id, :reviewable_type
  json.url review_url(review, format: :json)
end
