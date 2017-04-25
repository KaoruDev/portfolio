source 'https://rubygems.org'

ruby '2.4.0'

gem 'rails', '5.0.2'

# Ops =================================

gem 'pg'

# Assets ==============================

gem 'autoprefixer-rails'
gem 'bootstrap-sass', '~> 3.3.3'
gem 'font-awesome-sass', '~> 4.5.0'
gem 'jquery-rails'
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
gem 'nokogiri', '~> 1.6.8rc2' # https://github.com/rubygems/rubygems/issues/1389

#=======================================
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'awesome_print'
  gem 'pry-rails'
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
  gem 'puma'
  gem 'rails_12factor'
end
