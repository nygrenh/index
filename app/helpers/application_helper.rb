module ApplicationHelper
  def markdown(text)
    return if text.nil?
    renderer = Redcarpet::Render::HTML.new(filter_html: true)
    markdown = Redcarpet::Markdown.new(renderer, autolink: true)
    raw markdown.render(text)
  end
end
