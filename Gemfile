source 'https://rubygems.org'

# Padrino supports Ruby version 1.9 and later
# ruby '2.2.5'

# Distribute your app as a gem
# gemspec

# Server requirements
# gem 'thin' # or mongrel
# gem 'trinidad', :platform => 'jruby'

# Optional JSON codec (faster performance)
# gem 'oj'

# Project requirements
gem 'rake'

# Component requirements
gem 'mysql2'
gem 'sequel'

group :development do
  gem "capistrano", "~> 3.7"
end

# Test requirements
gem 'rspec', :group => 'test'
gem 'rack-test', :require => 'rack/test', :group => 'test'

# Padrino Stable Gem
gem 'padrino', '0.14.2'

gem 'guard'
gem 'guard-rspec', require: false

gem 'grape'

# Or Padrino Edge
# gem 'padrino', :github => 'padrino/padrino-framework'

# Or Individual Gems
# %w(core support gen helpers cache mailer admin).each do |g|
#   gem 'padrino-' + g, '0.14.2'
# end
