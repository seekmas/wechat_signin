json.array!(@medals) do |medal|
  json.extract! medal, :id, :name, :thumb_cover, :enabled
  json.url medal_url(medal, format: :json)
end
