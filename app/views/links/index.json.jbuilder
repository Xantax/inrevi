json.array!(@links) do |link|
  json.extract! link, :id, :link, :text
  json.url link_url(link, format: :json)
end
