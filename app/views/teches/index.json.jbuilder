json.array!(@teches) do |tech|
  json.extract! tech, :id, :name, :website
  json.url tech_url(tech, format: :json)
end
