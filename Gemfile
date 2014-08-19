source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.5'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder'

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.2'

# Load enviroment variables
gem 'dotenv-rails'

# CSS framework
gem 'bootstrap-sass'

# Icons
gem 'font-awesome-rails'

# Markdown parser
gem 'redcarpet'

# Pagination gem
gem 'kaminari'

# Use haml for views
gem 'haml-rails'

# Webserver
gem 'puma'

# Search
gem 'pg_search'

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

group :development do
  gem 'rails_layout'
  gem 'byebug'
  # better error messages
  gem 'better_errors', '~> 1.1.0'
  gem 'binding_of_caller', '~> 0.7.2'
  gem 'rack-mini-profiler'
end

group :test do
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'launchy'
  # Stubs and mocks for testing
  gem 'rspec-activemodel-mocks'
  # Matchers for common Rails functionality
  gem 'shoulda-matchers', require: false
  gem 'simplecov', require: false
  gem 'coveralls', require: false
end

group :development, :test do
  gem 'rspec-rails'
  gem 'sqlite3'
end

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end
