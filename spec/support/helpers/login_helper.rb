module LoginHelper
  def sign_in(credentials)
    visit new_session_path
    fill_in('name', with:credentials[:name])
    fill_in('password', with:credentials[:password])
    click_button('Log in')
  end
end