json.array!(@episodes) do |episode|
  json.extract! episode, :id, :title, :url
end
