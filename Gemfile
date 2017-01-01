source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '2.3.0'
#ruby-gemset=squro

gem 'rails', '~> 5.0.1'
gem 'puma', '~> 3.0'
gem 'pg'
gem 'haml-rails'
gem 'sass-rails', '~> 5.0'
gem 'bootstrap-sass'
gem 'jquery-rails'
gem 'uglifier', '>= 1.3.0'
gem 'turbolinks', '~> 5'

group :development, :test do
  gem 'faker'
  gem 'byebug', platform: :mri
end

group :development do  
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :production do
  gem 'rails_12factor'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]