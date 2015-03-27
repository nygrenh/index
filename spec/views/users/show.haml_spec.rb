require 'rails_helper'
require 'byebug'

describe 'users/show.haml' do
  before(:each) do
    @user = FactoryGirl.create(:user)
    @user.links << FactoryGirl.create(:link)
    allow(@user).to receive(:tags).and_return(Array.new(5))
    allow(@user).to receive(:domains).and_return(Array.new(12))
    allow(@user).to receive(:notes).and_return(Array.new(33))
    allow(@user).to receive(:created_at).and_return(Time.now)
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to have_content(@user.name)
  end

  it 'shows link count' do
    render
    expect(rendered).to match(/Links: 1/)
  end

  it 'shows tag count' do
    render
    expect(rendered).to match(/Tags: 5/)
  end

  it 'shows domain count' do
    render
    expect(rendered).to match(/Domains: 12/)
  end

  it 'shows note count' do
    render
    expect(rendered).to match(/Notes: 33/)
  end

  it 'shows timestamp' do
    render
    expect(rendered).to match(/just now/)
  end
end
