source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'

gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rails', '~> 6.1.3', '>= 6.1.3.2'

gem 'bootsnap', '>= 1.4.4', require: false

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'figaro'
  gem 'pry'
  gem 'shoulda-matchers', '~> 3.1'
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'rubocop-rails'
end

group :test do
  gem 'rspec-rails'
  gem 'simplecov'
end

gem 'factory_bot_rails'
gem 'faker'
gem 'fast_jsonapi'

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
