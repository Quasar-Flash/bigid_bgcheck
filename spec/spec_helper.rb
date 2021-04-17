require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development, :test)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end

require 'simplecov'
SimpleCov.start do
  add_filter 'spec'
end

require "minitest/autorun"
require "minitest/spec"
begin
  require "minitest/pride"
rescue LoadError
  # Continue, but without colors
end

# minitest/mock # Uncomment me to use minitest mocks
