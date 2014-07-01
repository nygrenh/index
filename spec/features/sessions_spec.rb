require 'rails_helper'
include LoginHelper

describe 'Sessions' do
  let(:user) { FactoryGirl.create(:user) }

  describe 'after succesful login' do
    it 'redirects to frontpage' do
      visit new_session_path
      log_in(name: user.name, password: user.password)
      expect(page.current_url).to eq('http://www.example.com/links')
    end

    describe 'when user was redirected to login page' do
      it 'redirects user back' do
        visit new_link_path
        log_in(name: user.name, password: user.password)
        expect(page.current_url).to eq('http://www.example.com/links/new')
      end
    end
  end
end
