json.array!(@drugs) do |drug|
  json.extract! drug, :id, :name, :image
  json.url drug_url(drug, format: :json)
end
