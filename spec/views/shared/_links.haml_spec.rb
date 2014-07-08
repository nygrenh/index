require 'rails_helper'

describe 'shared/_links.haml' do
  let(:links) { [FactoryGirl.create(:link, title: 'link_title')] }
  it 'renders the link' do
    render template: 'shared/_links.haml', locals: { links: links }
    expect(rendered).to match(links.first.title)
  end
end
