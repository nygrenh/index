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
    tag.link_count = 56
    render
    expect(rendered).to match(/Links: 56/)
  end
end
