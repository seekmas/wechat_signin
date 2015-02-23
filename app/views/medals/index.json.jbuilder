json.array!(@medals) do |medal|
  json.extract! medal, :id, :name, :cover, :enabled
  json.url medal_url(medal, format: :json)
end
