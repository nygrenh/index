FactoryGirl.define do
  factory :user do
    name 'Admin'
    password 'password'
    password_confirmation 'password'
  end

  factory :link do
    url 'http://www.example.com/'
  end
end
