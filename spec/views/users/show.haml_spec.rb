require 'rails_helper'

describe 'users/show.haml' do
  before(:each) do
    @user = assign(:user, stub_model(User,
      name: 'Name',
      password_digest: 'Password Digest'
    ))
    allow(@user).to receive(:links).and_return(Array.new(2))
    allow(@user).to receive(:tags).and_return(Array.new(5))
    allow(@user).to receive(:domains).and_return(Array.new(12))
    allow(@user).to receive(:notes).and_return(Array.new(33))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
  end

  it 'shows link count' do
    render
    expect(rendered).to match(/Links: 2/)
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

end
