source 'https://rubygems.org'

gem 'rails', '3.2.13'
gem 'json'
gem 'rspec'
gem 'thin', '~> 1'
gem 'jquery-rails', '~> 2'
gem 'jquery-ui-rails'
gem 'redcarpet'
gem 'pg', '~> 0.13'
gem 'flickraw'

# Misc libraries
# gem 'bcrypt-ruby', '~> 3', require: 'bcrypt'
gem 'stringex', '~> 1', git: 'git://github.com/rsl/stringex.git'
gem 'kaminari', '~> 0.13'

group :production do
end

group :development do
  gem 'rails_best_practices', '~> 1'
end

group :test do
  gem 'capybara', '~> 1'
  gem 'spork', '~> 0.9'
  gem 'database_cleaner', '~> 0.7'
end

group :development, :test do
  gem 'foreman', '~> 0.40'
  gem 'faker', '~> 1'
  gem 'factory_girl_rails', '~> 1'
end

group :assets do
  gem 'sass-rails', '~> 3'
  gem 'coffee-rails', '~> 3'
  gem 'uglifier', '~> 1'
end
