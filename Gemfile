source 'http://rubygems.org'

gem 'rails', '3.2.14'
gem 'rails_12factor'

gem 'activeadmin'
gem "meta_search", '>= 1.1.0.pre'

gem 'devise'
gem 'impressionist'

gem 'paperclip'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

# for Heroku deployment - as described in Ap. A of ELLS book
group :development, :test do
  gem "factory_girl_rails", "~> 4.0"
  gem 'bcrypt-ruby', '~> 3.0.0'
  gem 'sqlite3'
  gem 'ruby-debug19'
  gem 'database_cleaner'
  gem 'capybara'
  gem 'launchy'
  gem 'rspec-rails'
  gem 'simplecov'

end

group :test do
  gem 'cucumber-rails'
  gem 'cucumber-rails-training-wheels'
end
group :production do
  gem 'pg'
  gem 'bcrypt-ruby', '~> 3.0.0'
  #COMMENTED OUT BECAUSE OF MERGE CONFLICTS WITH BOOTSTRAP 3
  #gem 'rails_log_stdout',	github: 'heroku/rails_log_stdout'
  #gem 'rails3_serve_static_assets',	github: 'heroku/rails3_serve_static_assets'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'jquery-rails'
  gem 'therubyracer', '~> 0.12.0'
  gem 'sass-rails', '~> 3.2.6'
  gem 'coffee-rails', '~> 3.2.2'
  gem 'uglifier'
  gem 'bootstrap-sass'
  gem 'anjlab-bootstrap-rails', :require=> 'bootstrap-rails', :github => 'anjlab/bootstrap-rails'
end


gem 'haml'
gem 'jquery-ui-rails'
gem 'best_in_place'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

