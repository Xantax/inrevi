json.array!(@tvshow_reviews) do |tvshow_review|
  json.extract! tvshow_review, :id, :title, :content, :user_id, :tvshow_id
  json.url tvshow_review_url(tvshow_review, format: :json)
end
