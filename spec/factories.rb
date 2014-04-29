FactoryGirl.define do
	factory :user do
		name 'Admin'
		password 'password'
		password_confirmation 'password'
	end
end