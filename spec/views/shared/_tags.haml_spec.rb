require 'rails_helper'

describe 'shared/_tags.haml' do
  subject(:rendered) { render template: 'shared/_tags.haml', locals: { tags: tags } }
  let(:tag) { FactoryGirl.create(:tag, name: 'normal', link_count: 3) }
  let(:popular_tag) { FactoryGirl.create(:tag, name: 'popular', link_count: 44) }
  let(:tags) { [tag, popular_tag] }

  it 'renders tags' do
    expect(rendered).to match(tags.first.name)
  end

  it 'sorts tags' do
    expect(rendered).to match(/popular.*normal/m)
  end

end
