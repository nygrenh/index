require 'rails_helper'
include LoginHelper

describe 'User' do

  describe 'who has registered' do
    let(:user) { FactoryGirl.create(:user) }

    it 'can log in' do
      visit new_session_path
      fill_in('name', with: user.name)
      fill_in('password', with: user.password)
      click_button('Log in')
      expect(page).to have_content("You've logged in.")
    end

    it 'cannot log in with incorrect password' do
      visit new_session_path
      fill_in('name', with: user.name)
      fill_in('password', with: 'wrong')
      click_button('Log in')
      expect(page).to have_content('Username and password do not match.')
    end

    describe 'who has logged in' do
      before :each do
        log_in(name: user.name, password: user.password)
      end

      it 'can log out' do
        visit root_path
        click_link('Log out')
        expect(page).to have_content('Log in')
      end
    end
  end
end
