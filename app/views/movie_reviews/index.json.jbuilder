json.array!(@movie_reviews) do |movie_review|
  json.extract! movie_review, :id
  json.url movie_review_url(movie_review, format: :json)
end
