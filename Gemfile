source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'rails', '6.1.0'
gem 'pg', '1.2.3'
gem 'puma', '5.0.4'
gem 'devise'
gem 'sass-rails', '6.0.0'
gem 'turbolinks', '5.2.1'
gem 'bootsnap', '1.4.6', require: false
gem 'kaminari', '1.2.1'
gem 'rest-client', '2.1.0'

group :development, :test do
  gem 'byebug', '11.1.3', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails', '4.0.1'
  gem 'factory_bot_rails'
  gem 'rails-controller-testing'
end

group :development do
  gem 'web-console', '4.1.0'
  gem 'listen', '3.3.0'
  gem 'spring', '2.1.1'
  gem 'spring-watcher-listen', '2.0.1'
end

group :test do
  gem 'capybara', '3.32.2'
  gem 'selenium-webdriver', '3.142.7'
  gem 'webdrivers', '4.3.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
