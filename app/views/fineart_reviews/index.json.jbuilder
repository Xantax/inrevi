json.array!(@fineart_reviews) do |fineart_review|
  json.extract! fineart_review, :id, :content, :user_id, :fineart_id
  json.url fineart_review_url(fineart_review, format: :json)
end
