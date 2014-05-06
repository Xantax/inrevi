json.array!(@podcast_reviews) do |podcast_review|
  json.extract! podcast_review, :id, :title, :content, :user_id, :podcast_id
  json.url podcast_review_url(podcast_review, format: :json)
end
