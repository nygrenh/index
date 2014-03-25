json.array!(@links) do |link|
  json.extract! link, :id, :title, :url, :description, :source, :user_id, :domain_id
  json.url link_url(link, format: :json)
end
