source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = '#{repo_name}/#{repo_name}' unless repo_name.include?('/')
  'https://github.com/#{repo_name}.git'
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.2'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'jbuilder', '~> 2.5'
# gem 'redis', '~> 3.0'

# Authentication
gem 'clearance'
gem 'google-authenticator-rails'

# Database mapping
gem 'rails-erd'

# Attachments
gem 'paperclip'

# Theming etc
gem 'simple_form'

# Listing and filtering
gem 'smart_listing'

#drag and drop image upload
gem 'dropzonejs-rails'

#multiselect
gem 'select2-rails'

gem 'virtus'
# markdown?
# geolocation?
# mapping?
# google authentication?

source 'https://rails-assets.org' do
  gem 'rails-assets-bootstrap-sass-official'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  gem 'factory_girl_rails'
  gem 'better_errors'
  gem 'database_cleaner'
  gem 'faker', git: "https://github.com/stympy/faker"
  gem 'rspec-rails', '~> 3.5'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'guard'
  gem 'guard-minitest'
  gem 'letter_opener'
  # REPL in tests
  gem "binding_of_caller"
end

group :test do
  gem 'capybara'
  gem 'mocha'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'simplecov', :require => false
end

group :production do
  gem 'rails_12factor'
end
