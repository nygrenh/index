require 'rails_helper'

describe 'links/index.haml' do
  subject(:rendered) { render }
  before(:each) do
    link = stub_model(Link,
                      title: 'Title',
                      url: 'Url',
                      description: 'MyText',
                      source: 'Source',
                      user_id: 1,
                      domain_id: 'Domain'
    )
    links = [link]
    allow(links).to receive(:current_page) { 1 }
    allow(links).to receive(:total_pages) { 1 }
    allow(links).to receive(:limit_value) { 1 }
    allow(link).to receive(:created_at) { Time.now }
    assign(:links, links)
  end

  it { is_expected.to render_template(partial: 'shared/_links') }
end
