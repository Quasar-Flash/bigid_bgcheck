# frozen_string_literal: true

require "simplecov"

SimpleCov.formatters = [SimpleCov::Formatter::HTMLFormatter]
SimpleCov.minimum_coverage 70.0

SimpleCov.start do
  add_filter "/spec/"
  minimum_coverage 70
  minimum_coverage_by_file 50
end

require "bigid_auth"
require "bigid/bgcheck/base_error"

Dir["./spec/support/**/*.rb"].each { |f| require f }
Dir["./spec/initializers/**/*.rb"].each { |f| require f }
Dir["./lib/**/*.rb"].sort.each { |file| require file }

require "rubygems"
require "bundler"
require "bigid_bgcheck"
require "factory_bot"
require "pry"

begin
  Bundler.setup(:default, :development, :test)
rescue Bundler::BundlerError => e
  warn e.message
  warn "Run `bundle install` to install missing gems"

  exit e.status_code
end

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods

  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

FactoryBot.find_definitions
