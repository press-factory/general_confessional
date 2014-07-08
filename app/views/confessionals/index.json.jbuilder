json.array!(@confessionals) do |confessional|
  json.extract! confessional, :id, :confessor, :confession
  json.url confessional_url(confessional, format: :json)
end
