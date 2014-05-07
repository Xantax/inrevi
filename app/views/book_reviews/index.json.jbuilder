json.array!(@book_reviews) do |book_review|
  json.extract! book_review, :id, :title, :content, :user_id
  json.url book_review_url(book_review, format: :json)
end
