json.array!(@tech_reviews) do |tech_review|
  json.extract! tech_review, :id, :title, :content, :user_id, :tech_id
  json.url tech_review_url(tech_review, format: :json)
end
