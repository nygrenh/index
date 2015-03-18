require 'rails_helper'
include LoginHelper

describe Link do
  context 'when not signed in' do
    it 'cannot be created' do
      visit new_link_path
      expect(page).to have_content('Please log in.')
    end
  end

  context 'when signed in' do
    let(:user) { FactoryGirl.create(:user) }
    before :each do
      log_in(name: user.name, password: user.password)
    end

    describe 'creating links' do
      it 'works with a valid url' do
        visit new_link_path
        fill_in('link_url', with: 'http://www.test.com/')
        expect { click_button('Create Link') }.to change { Link.count }.by(1)
      end

      it 'creates tags' do
        visit new_link_path
        fill_in('link_url', with: 'http://www.test.com/')
        fill_in('link_tagstring', with: 'Test tag, Another test tag, Something')
        expect { click_button('Create Link') }.to change { Tag.count }.by(3)
      end
    end
  end

  it_behaves_like 'a private resource'
end
