source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
group :staging,:production do
   gem 'unicorn'
end

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# twitter bootstrap css & javascript toolkit
gem 'twitter-bootswatch-rails', '~> 3.2.0'

# twitter bootstrap helpers gem, e.g., alerts etc...
gem 'twitter-bootswatch-rails-helpers'

# OmniAuth
gem 'omniauth', '~> 1.2.1'
gem 'omniauth-twitter', '~> 1.0.1'

# i18n
gem 'rails-i18n', github: 'svenfuchs/rails-i18n', branch: 'master' # For 4.x

# Pageing
gem 'kaminari', '~> 0.15.1'
gem 'kaminari-bootstrap', '~> 3.0.1'

# Search
gem 'ransack', github: 'activerecord-hackery/ransack', branch: 'rails-4.2'

# carrierwave
gem 'carrierwave'
gem 'mini_magick'

# New Relic
gem 'newrelic_rpm'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  
  gem 'ripper-tags'
  gem 'gem-ripper-tags'
  gem 'guard'
  gem 'guard-shell'
  gem 'rev'
  gem 'rcodetools'
  gem 'rdefs'
  gem 'pry-rails'
  gem 'pry-doc'
  gem 'pry-stack_explorer'
  gem 'pry-theme'
  gem 'pry-byebug'
  gem 'hirb'
  gem 'hirb-unicode'
  gem 'rubocop'
  gem 'ruby-lint'
  gem 'method_source', ">= 0.8.2"
  gem 'yard'
  gem 'redcarpet'
  gem 'guard-yard'
  gem 'guard-livereload'
  gem 'rack-livereload'
  gem "better_errors"
  gem "binding_of_caller"
  gem 'rails-erd', github: 'ready4god2513/rails-erd', branch: 'rails-4.2-support-fix'
  gem 'foreman'
  gem 'guard-foreman'
  gem 'annotate', '~> 2.6.5'
  gem 'rspec-rails', '3.0.2'
  gem 'guard-rspec', require: false
  gem 'factory_girl_rails'
  gem "spring-commands-rspec"
  gem "capistrano", "3.1.0"
  gem "capistrano-rails"
  gem "capistrano-bundler"
  gem "capistrano3-unicorn"
end

group :test do
   gem 'shoulda-matchers', require: false
   gem 'capybara'
   gem 'poltergeist'
   gem 'database_cleaner'
end
