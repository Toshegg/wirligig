source 'https://rubygems.org'

gem 'rails', '4.2.5'

gem 'pg'

gem 'uglifier', '>= 1.3.0'

gem 'coffee-rails', '~> 4.1.0'

gem 'jquery-rails'

gem 'jbuilder', '~> 2.0'

# For documentation
gem 'sdoc', '~> 0.4.0', group: :doc

# HTML engine
gem 'slim', :git => 'git://github.com/brennancheung/slim.git', :branch => 'angularjs_support'
# For geolocation
gem 'geokit-rails'

# To use respond_to
gem 'responders'

# branch to fix error
gem 'less-rails', :git => 'https://github.com/suzan2go/less-rails.git', :branch => 'fix-nomethoderror-for-sprockets3'
gem 'less-rails-bootstrap'
gem 'font-awesome-less', '= 4.0.1'

gem 'angularjs-rails', '= 1.3.10'
gem 'angular-rails-templates', '~> 0.1.2'
gem 'angularjs-file-upload-rails', '~> 2.2.0'

gem 'therubyracer', platforms: :ruby

gem 'russian'

gem 'devise_token_auth'
gem 'omniauth-facebook'
gem 'omniauth-google-oauth2'

gem 'dotenv-rails'

gem "paperclip", "~> 5.0.0.beta1"
# with newer version angular-rails-templates raises an error
gem 'sprockets', '2.12.3'

group :development do
  gem 'capistrano'
  gem 'capistrano-rails'
  gem 'capistrano-rvm'
  gem 'capistrano3-unicorn'
end

group :development, :test do
  # For debugging
  gem 'byebug'
  gem 'rspec-rails', '~> 3.0'
  gem 'factory_girl_rails'
end

group :test do
  gem 'faker'
  gem 'capybara'
  gem 'database_cleaner'
end

group :development do
  gem 'web-console', '~> 2.0'

  gem 'spring'
end

group :production do
  gem 'unicorn'
end
