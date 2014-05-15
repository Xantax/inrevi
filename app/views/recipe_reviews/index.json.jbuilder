json.array!(@recipe_reviews) do |recipe_review|
  json.extract! recipe_review, :id, :title, :content, :user_id, :recipe_id
  json.url recipe_review_url(recipe_review, format: :json)
end
