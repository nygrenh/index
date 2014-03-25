json.array!(@domains) do |domain|
  json.extract! domain, :id, :domain, :description
  json.url domain_url(domain, format: :json)
end
