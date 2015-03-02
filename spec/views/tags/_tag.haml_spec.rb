require 'rails_helper'

describe 'tags/_tag.haml' do
  subject(:rendered) { render template: 'tags/_tag.haml', locals: { tag: tag } }
  let(:tag) { FactoryGirl.create(:tag, name: 'normal', links_count: 3) }

  it 'renders the tag' do
    expect(rendered).to match(tag.name)
  end
end
