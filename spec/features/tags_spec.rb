require 'rails_helper'
include LoginHelper

describe Tag do
  it_behaves_like 'a private resource'

  let(:user) { FactoryGirl.create(:user) }
  before :each do
    log_in(name: user.name, password: user.password)
    visit new_link_path
    fill_in('link_url', with: 'http://www.test.com/')
    fill_in('link_tagstring', with: 'Test tag')
    click_button('Create Link')
  end

  describe 'creating links' do
    it 'changes link count' do
      tag = Tag.last
      visit tag_path(tag)
      expect(page).to have_content('Links: 1')
    end
  end

  describe 'destroying all the links' do
    it 'destroys the tag' do
      Link.last.destroy
      visit '/tags'
      expect(page).not_to have_content('Test tag')
    end
  end

  describe 'untagging' do
    it 'decreases link count' do
      visit new_link_path
      fill_in('link_url', with: 'http://www.test2.com/')
      fill_in('link_tagstring', with: 'Test tag')
      click_button('Create Link')
      visit edit_link_path(Link.last)
      fill_in('link_tagstring', with: '')
      click_button('Update Link')
      expect(Tag.last.links_count).to eq(1)
    end

    describe 'everything' do
      it 'destroys the tag' do
        tag = Tag.last
        visit edit_link_path(Link.last)
        fill_in('link_tagstring', with: '')
        click_button('Update Link')
        expect(Tag.where(id: tag.id)).to be_empty
      end
    end
  end
end
