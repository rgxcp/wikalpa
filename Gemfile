source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.1"

###########
# DEFAULT #
###########
# Use Active Model has_secure_password
gem "bcrypt", "~> 3.1.7"
# Reduces boot times through caching
gem "bootsnap", ">= 1.4.4", require: false
# Use PostgreSQL as the database for Active Record
gem "pg", "~> 1.1"
# Use Puma as the app server
gem "puma", "~> 5.0"
# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 6.1.4", ">= 6.1.4.1"
# Windows zoneinfo files
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
# Use Active Storage variant
# gem "image_processing", "~> 1.2"
# Build JSON APIs with ease
# gem "jbuilder", "~> 2.7"
# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS)
# gem "rack-cors"
# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"

##########
# ADD-ON #
##########
# Authentication
gem "jwt"
# Background job
gem "sidekiq"

group :development do
  ###########
  # DEFAULT #
  ###########
  # Listen to file modifications
  gem "listen", "~> 3.3"
  # Rubocop Ruby
  gem "rubocop", require: false
  # Rubocop Rails
  gem "rubocop-rails", require: false
  # Rubocop RSpec
  gem "rubocop-rspec", require: false
  # Keep application running in the background
  gem "spring"
end

group :test do
  ##########
  # ADD-ON #
  ##########
  # RSpec matchers for Sidekiq
  gem "rspec-sidekiq"
  # Test matchers
  gem "shoulda-matchers", "~> 5.0"
  # Code coverage generator
  gem "simplecov"
  # SimpleCov XML formatter
  gem "simplecov-cobertura"
end

group :development, :test do
  ###########
  # DEFAULT #
  ###########
  # Call "byebug" anywhere in the code to stop execution and get a debugger console
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]

  ##########
  # ADD-ON #
  ##########
  # Test data factory
  gem "factory_bot_rails"
  # Debugger
  gem "pry", "~> 0.13.1"
  # Pry navigator
  gem "pry-nav"
  # Testing framework
  gem "rspec-rails", "~> 5.0.0"
end
