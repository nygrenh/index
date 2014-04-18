json.array!(@link_tags) do |link_tag|
  json.extract! link_tag, :id, :link_id, :tag_id
  json.url link_tag_url(link_tag, format: :json)
end
