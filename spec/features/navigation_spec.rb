require 'rails_helper'
include LoginHelper

describe 'Navigation' do
  let(:user) { FactoryGirl.create(:user) }
  before :each do
    log_in(name: user.name, password: user.password)
  end

  describe 'active tab' do
    it 'should be set' do
      visit links_path
      active = find 'li.active'
      expect(active).to have_content('Links')
    end
    it 'should change' do
      visit new_note_path
      active = find 'li.active'
      expect(active).to have_content('Notes')
    end
  end
end
