source 'https://rubygems.org'

ruby '2.2.3'

gem 'rails', '4.2.0'

# Ops =================================
#
gem 'pg'
gem 'unicorn'

# Assets ==============================

gem 'autoprefixer-rails'
gem 'bootstrap-sass', '~> 3.3.3'
gem 'font-awesome-sass', '~> 4.2.0'
gem 'jquery-rails'
gem 'pagedown-bootstrap-rails'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'

# App =================================

gem 'carrierwave'
gem 'devise'
gem 'figaro'
gem 'fog'
gem 'redcarpet'
gem "mini_magick"
gem 'will_paginate', '~> 3.0.6'

#=======================================
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'awesome_print'
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
end

group :production do
  gem 'rails_12factor'
end
