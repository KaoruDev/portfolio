source 'https://rubygems.org'

ruby '2.2.3'

gem 'rails', '4.2.0'

gem 'pg'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'unicorn'

gem 'devise'
gem 'awesome_print'

gem 'bootstrap-sass', '~> 3.3.3'
gem 'autoprefixer-rails'
gem 'font-awesome-sass', '~> 4.2.0'
gem 'pagedown-bootstrap-rails'
gem 'will_paginate', '~> 3.0.6'
gem 'carrierwave'
gem "mini_magick"
gem 'fog'
gem 'figaro'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'pry'
  gem 'pry-rails'
  gem 'spring'
  gem 'rspec-rails', '~> 3.0'
  gem 'faker'
end

group :test do
  gem 'fabrication'
end

group :development do
  gem 'rack-livereload'
  gem 'guard-livereload', require: false
  gem 'guard-rspec', require: false
end

group :production do
  gem 'rails_12factor'
end
