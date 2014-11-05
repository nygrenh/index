require 'rails_helper'
include LoginHelper

describe Domain do
  it_behaves_like 'a private resource'

  let(:user) { FactoryGirl.create(:user) }
  before :each do
    log_in(name: user.name, password: user.password)
  end

  describe 'removing links' do
    it 'decreases link count' do
      visit new_link_path
      fill_in('link_url', with: 'http://www.domain.com/')
      click_button('Create Link')
      visit links_path
      visit new_link_path
      fill_in('link_url', with: 'http://www.domain.com/2')
      click_button('Create Link')
      visit links_path
      first('.entry').click_link('Destroy')
      expect(Domain.last.link_count).to eq(1)
    end
  end
end
