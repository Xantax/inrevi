json.array!(@tvshow_reviews) do |tvshow_review|
  json.extract! tvshow_review, :id, :tvshow_id, :user_id, :title, :content
  json.url tvshow_review_url(tvshow_review, format: :json)
end
