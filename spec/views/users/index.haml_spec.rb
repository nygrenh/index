require 'rails_helper'

describe 'users/index.haml' do
  before(:each) do
    assign(:users, [
      stub_model(User,
                 name: 'Name',
                 password_digest: 'Password Digest'
      ),
      stub_model(User,
                 name: 'Name',
                 password_digest: 'Password Digest'
      )
    ])
  end

  it 'renders a list of users' do
    render
    assert_select 'ul>li', text: 'Name'.to_s, count: 2
  end
end
