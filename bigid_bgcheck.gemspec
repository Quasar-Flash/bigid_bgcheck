# frozen_string_literal: true

$LOAD_PATH.push File.expand_path("lib", __dir__)
require "bigid/bgcheck/version"

Gem::Specification.new do |s|
  s.name        = "bigid_bgcheck"
  s.version     = Bigid::Bgcheck::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Danilo Carolino"]
  s.email       = ["danilo.carolino@qflash.com.br"]
  s.homepage    = "https://github.com/Quasar-Flash/bigid_bgcheck"
  s.summary     = "Bigid Background Check Library"
  s.description = "A library to use BigData Corps background check features"
  s.required_ruby_version = ">= 2.7"
  s.files = Dir["{lib}/**/*"] + Dir["{docs}/**/*"] + ["Rakefile"]
  s.test_files = Dir["spec/**/*"]
  s.license = "MIT"

  s.metadata["changelog_uri"] = "https://github.com/Quasar-Flash/bigid_bgcheck/blob/master/CHANGELOG.md"
  s.metadata["source_code_uri"] = "https://github.com/Quasar-Flash/bigid_bgcheck"
  s.metadata["bug_tracker_uri"] = "https://github.com/Quasar-Flash/bigid_bgcheck/issues"

  s.add_dependency             "bigid_auth", "~> 1.0.1", ">= 1.0.0"
  s.add_dependency             "i18n"
  s.add_dependency             "json"
  s.add_dependency             "cpf_cnpj", "~> 0.5", ">= 0.5"

  s.add_development_dependency "factory_bot", "~> 6.3.0"
  s.add_development_dependency "pry", "~> 0.14.1"
  s.add_development_dependency "rspec", "~> 3.12.0"
  s.add_development_dependency "rubocop", "~> 1.59.0"
  s.add_development_dependency "rubocop-packaging", "~> 0.5.2"
  s.add_development_dependency "rubocop-performance", "~> 1.20.0"
  s.add_development_dependency "simplecov", "~> 0.22.0"
  s.add_development_dependency "simplecov-json", "~> 0.2.3"
end
