require 'rails_helper'

describe 'shared/_links.haml' do
  subject(:rendered) { render template: 'shared/_links.haml', locals: { links: links } }
  let(:link) { FactoryGirl.create(:link, title: 'link_title') }
  let(:links) { [link] }
  let(:time) { Time.utc(2014, 07, 9, 5) }
  let(:diff) { 7.minutes }

  it 'renders the link' do
    expect(rendered).to match(links.first.title)
  end

  it 'shows a timestamp' do
    allow(Time).to receive(:now) { time }
    allow(link).to receive(:created_at) { time - diff }
    expect(rendered).to match(/7 minutes ago/)
  end
end
