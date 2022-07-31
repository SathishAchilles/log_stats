# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

gem 'zeitwerk', '~> 2.6'

group :development do
  gem 'reek', '~> 6.1', '>= 6.1.1'
  gem 'rubocop', '~> 1.32', require: false
end

group :development, :test do
  gem 'byebug', '~> 11.1', '>= 11.1.3'
end

group :test do
  gem 'rspec', '~> 3.11'
end
