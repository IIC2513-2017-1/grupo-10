# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# Full-stack web framework. Read more: https://github.com/rails/rails
gem('rails', '~> 5.1')
# Ruby interface to PostgreSQL. Read more: https://rubygems.org/gems/pg
gem('pg', '~> 0.20.0')
# Use Puma as the app server
gem('puma', '~> 3.8', '>= 3.8.2')
# Sass adapter for Rails assets. Read more: https://github.com/rails/sass-rails
gem 'sass-rails', '~> 5.0', '>= 5.0.4'
# JavaScript assets compressor. Read more: https://github.com/lautis/uglifier
gem('uglifier', '~> 3.2')

# Jquery as the library. Read more: https://github.com/rails/jquery-rails
gem('jquery-rails', '~> 4.3', '>= 4.3.1')
# Faster apps. Read more: https://github.com/turbolinks/turbolinks
gem('turbolinks', '~> 5.0', '>= 5.0.1')
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem('jbuilder', '~> 2.6', '>= 2.6.3')
# Safe password handling. Read more: https://github.com/codahale/bcrypt-ruby
gem('bcrypt', '~> 3.1', '>= 3.1.11', platform: :ruby)

gem('paperclip')

group :development, :test do
  # Debugger console. Read more: https://github.com/deivid-rodriguez/byebug
  gem('byebug', '~> 9.0', '>= 9.0.6', platform: :mri)
end

group :development do
  # Listen to file modifications. Read more: https://github.com/guard/listen
  gem('listen', '~> 3.1', '>= 3.1.5')
  # Rails console in browser. Read more: https://github.com/rails/web-console
  gem('web-console', '~> 3.5')
  # Preload app. Read more: https://github.com/rails/spring
  gem('spring', '~> 2.0', '>= 2.0.1')
  # Read more: https://github.com/jonleighton/spring-watcher-listen
  gem('spring-watcher-listen', '~> 2.0', '>= 2.0.1')
end

# Zoneinfo files in Windows. Read more: https://github.com/tzinfo/tzinfo-data
gem(
  'tzinfo-data',
  '~> 1.2017',
  '>= 1.2017.2',
  platforms: %i[mingw mswin x64_mingw jruby]
)
