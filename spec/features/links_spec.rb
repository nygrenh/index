require 'spec_helper'
include LoginHelper

describe 'Link' do 
  describe 'when not signed in' do
    it "cannot be created" do
      visit new_link_path
      expect(page).to have_content('You should be signed in.')
    end
  end

  describe 'when signed in' do 
    before :each do
      user = FactoryGirl.create(:user)
      sign_in(name:"Admin", password:"password")
    end

    describe 'creating links' do

      it "works with a valid url" do 
        visit new_link_path
        fill_in('link_url', with: 'http://www.test.com/')
        expect{
          click_button('Create Link')
          }.to change{Link.count}.by(1)
      end

      it "creates tags" do
        visit new_link_path
        fill_in('link_url', with: 'http://www.test.com/')
        fill_in('link_tags', with: 'Test tag, Another test tag, Something')
        expect{
          click_button('Create Link')
          }.to change{Tag.count}.by(3)
      end
    end
  end
end