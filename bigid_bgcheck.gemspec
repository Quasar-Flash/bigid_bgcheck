# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "bigid/bgcheck/version"

Gem::Specification.new do |s|
  s.name        = "bigid_bgcheck"
  s.version     = Bigid::Bgcheck::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Danilo Carolino"]
  s.email       = ["danilo.carolino@qflash.com.br"]
  s.homepage    = "https://github.com/Quasar-Flash/bigid-bgcheck-ruby"
  s.summary     = 'Bigid Background Check Library'
  s.description = 'A library to use BigData Corps background check features'

  s.files = Dir["{lib}/**/*"] + ['LICENSE.txt', 'Rakefile', 'README.rdoc', 'CHANGELOG.md']
  s.test_files = Dir["spec/**/*"]
  s.license = 'MIT'

  s.add_dependency             'faraday'
  s.add_dependency             'i18n'
  s.add_dependency             'json'

  s.add_development_dependency 'bundler', '>= 1.2.0'
  s.add_development_dependency 'rake', '>= 10.0.0'
  s.add_development_dependency 'minitest'
  s.add_development_dependency 'simplecov'
end
