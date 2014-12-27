source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 4.2.0'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '~> 2.6.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.1.0'

# Use jquery as the JavaScript library
gem 'jquery-rails', '~> 4.0.2'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks', '~> 2.5.3'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.2.6'

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.9'

# Load enviroment variables
gem 'dotenv-rails', '~> 1.0.2'

# CSS framework
gem 'bootstrap-sass', '~> 3.3.1'
# Select extension
gem 'bootstrap-select-rails', '~> 1.6.3'

# Icons
gem 'font-awesome-rails', '~> 4.2.0'

# Markdown parser
gem 'redcarpet', '~> 3.2.2'

# Pagination gem
gem 'kaminari', '~> 0.16.1'

# Use haml for views
gem 'haml-rails', '~> 0.6.0'

# Webserver
gem 'puma', '~> 2.10.2'

# Search
gem 'pg_search', '~> 0.7.8'

# Charts
gem 'chartkick', '~> 1.3.2'
gem 'groupdate', '~> 2.3.0'

group :production do
  gem 'pg', '~> 0.17.1'
  gem 'rails_12factor', '~> 0.0.3'
end

group :development do
  gem 'rails_layout', '~> 1.0.24'
  gem 'byebug', '~> 3.5.1'
  # better error messages
  gem 'better_errors', '~> 2.0.0'
  gem 'binding_of_caller', '~> 0.7.2'
  gem 'rack-mini-profiler', '~> 0.9.2'
end

group :test do
  gem 'factory_girl_rails', '~> 4.5.0'
  gem 'capybara', '~> 2.4.4'
  gem 'launchy', '~> 2.4.3'
  # Stubs and mocks for testing
  gem 'rspec-activemodel-mocks', '~> 1.0.1'
  # Matchers for common Rails functionality
  gem 'shoulda-matchers', '~> 2.7.0', require: false
  gem 'simplecov', '~> 0.9.1', require: false
  gem 'coveralls', '~> 0.7.2', require: false
end

group :development, :test do
  gem 'rspec-rails', '~> 3.1.0'
  gem 'sqlite3', '~> 1.3.10'
end

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', '~> 0.4.1', require: false
end
