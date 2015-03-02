require 'rails_helper'

describe 'tags/show.haml' do
  let(:tag) { FactoryGirl.create(:tag, name: 'Egregious', description: 'It is.') }

  before(:each) do
    assign(:tag, tag)
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(tag.name)
    expect(rendered).to match(tag.description)
  end

  it 'shows link count' do
    allow(tag).to receive(:links_count) { 56 }
    render
    expect(rendered).to match(/Links: 56/)
  end

  it 'shows timestamp' do
    render
    expect(rendered).to match(/just now/)
  end
end
