require 'rails_helper'

describe 'domains/show.haml' do
  let(:domain) { FactoryGirl.create(:domain, domain: 'Cool Domain', description: 'Awesome') }

  before(:each) do
    @domain = domain
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(domain.domain)
    expect(rendered).to match(domain.description)
  end

  it 'shows link count' do
    allow(domain).to receive(:links_count) { 33 }
    render
    expect(rendered).to match(/Links: 33/)
  end

  it 'shows timestamp' do
    render
    expect(rendered).to match(/just now/)
  end
end
