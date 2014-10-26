require 'rails_helper'
include LoginHelper

describe Tag do
  it_behaves_like 'a private resource'

  let(:user) { FactoryGirl.create(:user) }
  before :each do
    log_in(name: user.name, password: user.password)
  end

  describe 'creating links' do
    it 'changes link count' do
      visit new_link_path
      fill_in('link_url', with: 'http://www.test.com/')
      fill_in('link_tags', with: 'Test tag')
      click_button('Create Link')
      tag = Tag.last
      visit tag_path(tag)
      expect(page).to have_content('Links: 1')
    end
  end
end
