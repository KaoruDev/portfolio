source 'https://rubygems.org'

ruby '2.5.1'

gem 'rails', '5.2.1'

# Ops =================================

gem 'pg'

# Assets ==============================

gem 'autoprefixer-rails', '~> 9'
gem 'bootstrap-sass', '~> 3.3.3'
gem 'font-awesome-sass', '~> 4.5.0'
gem 'jquery-rails', '~> 4'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'

# App =================================

gem 'devise', '~> 4.3'
gem 'redcarpet', '~> 3.4'
gem 'will_paginate', '~> 3.0.6'

#=======================================
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'awesome_print'
  gem 'pry-rails'
  gem 'rspec-rails', '~> 3'
  gem 'faker'
end

group :test do
  gem 'fabrication'

  # TODO: shouldn't need this once we move to integration tests
  gem 'rails-controller-testing'
end

group :development do
  gem 'rack-livereload'
  gem 'guard-livereload', require: false
end

group :production do
  gem 'puma'
  gem 'rails_12factor'
end
