require 'spec_helper'
include LoginHelper
require 'byebug'

describe 'Sessions' do
  before :each do
    FactoryGirl.create(:user)
  end

  describe 'after succesful login' do
    it "redirects to frontpage" do
      visit new_session_path
      sign_in(name:"Admin", password:"password")
      expect(page.current_url).to eq('http://www.example.com/links')
    end

    describe 'when user was redirected to login page' do
      it 'redirects user back' do
        visit new_link_path
        sign_in(name:"Admin", password:"password")
        expect(page.current_url).to eq('http://www.example.com/links/new')
      end
    end
  end
end
