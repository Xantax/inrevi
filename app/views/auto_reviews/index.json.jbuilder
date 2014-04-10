json.array!(@auto_reviews) do |auto_review|
  json.extract! auto_review, :id, :title, :content, :user_id, :auto_id
  json.url auto_review_url(auto_review, format: :json)
end
