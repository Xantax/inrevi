json.array!(@promotions) do |promotion|
  json.extract! promotion, :id, :text, :link
  json.url promotion_url(promotion, format: :json)
end
