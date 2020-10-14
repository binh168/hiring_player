source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.5.1"

gem "rails", "~> 6.0.0"
gem "mysql2", ">= 0.4.4", "< 0.6.0"
gem "puma", "~> 3.11"
gem "sass-rails", "~> 5"
gem "webpacker"
gem "turbolinks", "~> 5"
gem "jbuilder", "~> 2.7"
gem "bootsnap", ">= 1.4.2", require: false
gem "rails-i18n"
gem "bootstrap-sass", "~> 3.4.1"
gem "config"
gem "bcrypt"
gem "carrierwave"
gem "mini_magick"
gem "kaminari"
gem "kaminari-bootstrap"
gem "rails-controller-testing"
gem "ffaker"
gem "font_awesome5_rails"
gem "pry-rails"
gem "rubyzip"
gem "zip-zip"
gem "whenever", require: false
gem "figaro"
gem "sidekiq"
gem "devise"
gem "omniauth"
gem "omniauth-facebook"
gem "omniauth-google-oauth2"
gem "discordrb"
gem "rbnacl-libsodium"

group :test do
  gem "pry"
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "rspec-rails", "~> 4.0.0.beta2"
  gem "shoulda-matchers"
  gem "simplecov", require: false
  gem "factory_bot_rails"
  gem "rspec-sidekiq"
  gem "rspec-activemodel-mocks"
  gem "shoulda-whenever"
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :production do
  gem "pg"
end
