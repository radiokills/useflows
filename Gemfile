source 'https://rubygems.org'

ruby '2.0.0'

gem 'rails', '4.0.0'

gem 'pg'

gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'

gem 'jquery-rails'

#gem 'turbolinks'

gem 'heroku'


group :doc do
  gem 'sdoc', require: false
end

group :test do
  gem 'simplecov', require: false
  gem 'factory_girl_rails', require: false
  gem 'database_cleaner'
  gem 'capybara'
  # gem 'poltergeist'
end

group :test, :development do
  gem 'rspec-rails'
  gem 'spork', '1.0.0rc3'

  gem 'guard-rspec'
  gem 'guard-spork'
  gem 'guard-pow'

  gem 'pry-rails'
  gem 'pry-doc'
  gem 'dotenv-rails'
  gem 'launchy'

  gem 'foreman'
  gem 'webmock', require: false
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'meta_request'
  gem 'pry-remote'
  gem 'quiet_assets'
end

