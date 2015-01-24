require 'rails_helper'

describe 'links/_link.haml' do
  subject(:rendered) { render template: 'links/_link.haml', locals: { link: link } }
  let(:link) { FactoryGirl.create(:link, title: 'link_title') }
  let(:time) { Time.utc(2014, 07, 9, 5) }
  let(:diff) { 7.minutes }

  it 'renders the link' do
    expect(rendered).to match(link.title)
  end

  it 'shows a timestamp' do
    allow(Time).to receive(:now) { time }
    allow(link).to receive(:created_at) { time - diff }
    expect(rendered).to match(/7 minutes ago/)
  end
end
