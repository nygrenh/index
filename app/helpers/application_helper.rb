module ApplicationHelper
	def markdown(text)
		renderer = Redcarpet::Render::HTML.new(filter_html: true)
		markdown = Redcarpet::Markdown.new(renderer, autolink: true)
		raw markdown.render(text)
	end
end
