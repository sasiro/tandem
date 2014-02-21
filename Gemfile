source 'https://rubygems.org'
ruby '1.9.3'
gem 'rails', '3.2.13'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'
gem 'devise'
gem 'therubyracer'
gem 'omniauth-facebook'
gem 'simple_form'
gem 'holder_rails'
gem 'opentok'
gem 'debugger'
gem "cancan"
gem 'newrelic_rpm'
gem "letter_opener", :group => :development
gem 'will_paginate', '~> 3.0'
gem 'language_list'
gem 'customerio'
# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
 gem 'chosen-rails'
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby
gem "therubyracer"
gem "less-rails"
gem "twitter-bootstrap-rails"
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
group :development, :test do
  gem 'sqlite3'
  gem 'cucumber-rails'
  gem 'cucumber-rails-training-wheels' # some pre-fabbed step definitions
  gem 'database_cleaner' # to clear Cucumber's test database between runs
  gem 'capybara'         # lets Cucumber pretend to be a web browser
  gem 'launchy'          # a useful debugging aid for user stories
  gem 'debugger'
end
group :test do
  gem 'factory_girl_rails'
end
group :production do
  gem 'pg'
  gem 'thin'
end
# For heroku version 0.4.2 for rails console command
gem 'rb-readline', '~> 0.4.2'
# To use ActiveModel has_secure_password
#gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'
gem 'wicked'
