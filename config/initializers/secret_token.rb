# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
if Rails.env.test? 
	Index::Application.config.secret_key_base = 'f9610bdd1e99698872dda321217908adffc7771d3806dd60f4630b43c96eb142baffdc6bbe703539529aa6ed9f996c4dc606f26944bbee5f04149de214735d3f'
else
	Index::Application.config.secret_key_base = ENV['SECRET_TOKEN']
end