module ApplicationHelper
  def markdown(text)
    return if text.nil?
    renderer = Redcarpet::Render::HTML.new(filter_html: true)
    markdown = Redcarpet::Markdown.new(renderer, autolink: true)
    raw markdown.render(text)
  end

  def disable_submit(action)
    "<i class='fa fa-spinner fa-spin'></i> #{submit_action(action)}"
  end

  private

  def submit_action(action)
    action.include?('Create') ? 'Creating...' : 'Updating...'
  end
end
