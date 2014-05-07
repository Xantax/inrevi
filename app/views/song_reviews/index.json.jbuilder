json.array!(@song_reviews) do |song_review|
  json.extract! song_review, :id, :title, :content, :user_id, :song_id
  json.url song_review_url(song_review, format: :json)
end
