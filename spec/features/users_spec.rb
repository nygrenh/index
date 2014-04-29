require 'spec_helper'
include LoginHelper

describe 'User' do

  describe 'who has registered' do
    before :each do
      FactoryGirl.create :user
    end

    it "can log in" do
      visit new_session_path
      fill_in('name', with: 'Admin')
      fill_in('password', with: 'password')
      click_button('Log in')
      expect(page).to have_content("You've logged in.")
    end
  end

  describe 'who has logged in' do
    before :each do
      FactoryGirl.create :user
      sign_in(name:"Admin", password:"password")
    end

    it "can log out" do
      visit root_path
      click_link('Log out')
      expect(page).to have_content("Log in")
    end
  end
  
end