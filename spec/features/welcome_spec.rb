require 'rails_helper'

describe 'Welcome screen' do
  it 'should show welcome message' do
    ENV['WELCOME_MESSAGE'] = 'test message'
    visit welcome_index_path
    expect(page).to have_content('test message')
  end
end
