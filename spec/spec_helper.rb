# frozen_string_literal: true

require "rubygems"
require "bundler"

begin
  Bundler.setup(:default, :development, :test)
rescue Bundler::BundlerError => e
  warn e.message
  warn "Run `bundle install` to install missing gems"

  exit e.status_code
end

require "simplecov"

SimpleCov.start do
  add_filter "spec"
end

RSpec.configure do |config|
  # some (optional) config here
end

# minitest/mock # Uncomment me to use minitest mocks
