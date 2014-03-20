json.array!(@local_reviews) do |local_review|
  json.extract! local_review, :id, :user_id, :local_id, :title, :content
  json.url local_review_url(local_review, format: :json)
end
