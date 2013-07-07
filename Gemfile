source 'https://rubygems.org'

gem 'rails', '3.2.13'
gem 'jquery-rails'
gem 'flatui-rails'
gem 'unicorn'
gem 'coveralls', require: false
gem 'omniauth-facebook'
gem "omniauth-google-oauth2"
gem 'omniauth-twitter'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

group :test do
  gem 'simplecov', :require => false
  gem 'rspec-pride'
end

group :test, :development do
  gem 'sqlite3'
  gem 'rspec-rails', '~> 2.0'
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :production do
  gem 'pg'
end
