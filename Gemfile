source 'https://rubygems.org'

gem 'rails', '4.2.0'

gem 'pg'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'unicorn'

gem 'devise'
gem 'awesome_print'

gem 'bootstrap-sass', '~> 3.3.1'
gem 'autoprefixer-rails'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'pry'
  gem 'pry-rails'
  gem 'spring'
  gem 'rspec-rails', '~> 3.0'
end

group :test do
  gem 'fabricator'
  gem 'faker'
end

group :development do
  gem 'rack-livereload'
  gem 'guard-livereload', require: false
end

group :production do
  gem 'rails_12factor'
end
