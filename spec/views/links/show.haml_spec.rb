require 'rails_helper'

describe 'links/show.haml' do
  let(:tag) { FactoryGirl.create(:tag) }

  before(:each) do
    FactoryGirl.build(:domain, name: 'test.com')
    @link = FactoryGirl.create(:link, title: 'Title', description: 'Cool stuff')
    tags = [tag]
    allow(@link).to receive(:tags) { tags }
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(@link.title)
    expect(rendered).to match(@link.url)
    expect(rendered).to match(@link.description)
  end

  it 'renders tags' do
    render
    expect(rendered).to match(tag.name)
  end

  it 'shows a timestamp' do
    render
    expect(rendered).to match(/just now/)
  end
end
