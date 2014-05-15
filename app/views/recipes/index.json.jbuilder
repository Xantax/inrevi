json.array!(@recipes) do |recipe|
  json.extract! recipe, :id, :name, :image, :user_id, :ingredients, :directions
  json.url recipe_url(recipe, format: :json)
end
