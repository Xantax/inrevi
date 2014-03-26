json.array!(@drug_reviews) do |drug_review|
  json.extract! drug_review, :id, :title, :content, :user_id, :drug_id
  json.url drug_review_url(drug_review, format: :json)
end
