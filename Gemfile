source 'https://rubygems.org'
ruby '2.0.0'
#ruby-gemset=Website

gem 'rails', '4.1.0'
gem 'bcrypt'
gem 'sitemap_generator'
gem 'factory_girl_rails'

group :development, :test do
  gem 'rspec-rails'
  gem 'guard-rspec'
  gem 'spork-rails', '4.0.0'
  gem 'guard-spork', '1.5.1'
  gem 'childprocess'
  gem 'sqlite3'
  gem 'spring'
end

group :test do
  gem 'selenium-webdriver', '2.40.0'
  gem 'capybara'
  gem 'growl'
end

gem 'sass-rails', '4.0.3'
gem 'uglifier', '2.5.0'
gem 'coffee-rails', '4.0.1'
gem 'mailman'
gem 'jquery-rails', '3.1.0'
gem 'turbolinks', '2.2.2'
gem 'jbuilder', '2.0.6'
gem 'html2haml'
gem 'haml-rails'
gem 'whenever'
gem 'simple_form'
# For recieving emails when I can set this up
gem 'mandrill-rails'

group :doc do
  gem 'sdoc', '0.3.20', require: false
end

group :test, :production do
  gem 'pg', '0.17.1'
end

group :production do
  gem 'rails_12factor', '0.0.2'
  gem 'heroku_rails_deflate'
end
