FactoryGirl.define do
  factory :user do
    name 'Admin'
    password 'password'
    password_confirmation 'password'
  end

  factory :link do
    url 'http://www.example.com/'
  end

  factory :tag do
    name 'interesting'
    tag_type 'blue'
  end

  factory :domain do
    domain 'example.com'
  end

  factory :note do
    text 'note'
  end
end
