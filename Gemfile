source 'https://rubygems.org'
ruby "2.2.2"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '4.2.6'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'devise'
gem "cancan"
gem 'bootstrap-sass'
gem "ckeditor", :git => "https://github.com/galetahub/ckeditor.git"
gem 'paperclip'
gem "nested_form"
gem 'ratyrate'
gem 'kaminari'
gem 'bootstrap-kaminari-views'
gem 'jquery-turbolinks'
gem "font-awesome-rails"
gem "delayed_job_active_record"
gem 'daemons'
gem 'active_model_serializers'
gem 'rails-api'
gem 'owlcarousel-rails'
gem 'thinking-sphinx'

group :production do
  gem 'rails_12factor'
  gem 'pg'
end

group :development, :test do
  gem 'byebug'
  gem 'mysql2', '>= 0.3.13', '< 0.5'
end

group :development do
  gem 'web-console', '~> 2.0'

  gem 'spring'
end
