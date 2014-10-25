require 'rails_helper'
include LoginHelper

describe 'Searching' do
  let(:user) { FactoryGirl.create(:user) }

  before :each do
    log_in(name: user.name, password: user.password)
  end

  describe 'links' do
    let(:title) { 'title' }
    let(:description) { 'description' }
    let(:tag) { FactoryGirl.create(:tag, name: 'tag_name') }
    let!(:link) { FactoryGirl.create(:link, title: title, description: description, user_id: user.id) }

    it 'works with title' do
      visit '/search?q=' + title
      expect(page).to have_content(title)
    end

    it 'works with description' do
      visit '/search?q=' + description
      expect(page).to have_content(description)
    end

    it 'works with tags' do
      link.tags << tag
      visit '/search?q=' + tag.name
      expect(page).to have_content(tag.name)
    end

    it 'works with words that sound alike' do
      visit '/search?q=' + 'tattle'
      expect(page).to have_content(title)
    end

    describe 'that are not own' do
      let(:another_user) { FactoryGirl.create(:user, name: 'Smith') }
      let(:link) { FactoryGirl.create(:link, title: 'Unsearchable link', user_id: another_user.id)}
      it 'cannot be searched' do
        visit '/search?q=' + 'link'
        expect(page).not_to have_content(link.title)
      end
    end
  end
end
