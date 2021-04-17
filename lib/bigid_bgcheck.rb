require 'faraday'
require 'i18n'
require 'json'

require 'bigid/bgcheck/version'

require 'bigid/bgcheck/integration/multipart_flat'
require 'bigid/bgcheck/integration/response'
require 'bigid/bgcheck/integration/request'
require 'bigid/bgcheck/integration/connection'

require 'bigid/bgcheck/auth/connection'
require 'bigid/bgcheck/auth/authentication'
require 'bigid/bgcheck/auth/authenticated_resource'
require 'bigid/bgcheck/auth/authenticated_connection'

require 'bigid/bgcheck/base_error'
require 'bigid/bgcheck/bad_request_error'
require 'bigid/bgcheck/document_not_supported_error'
require 'bigid/bgcheck/internal_error'
require 'bigid/bgcheck/invalid_credentials_error'
require 'bigid/bgcheck/no_info_error'
require 'bigid/bgcheck/result'
require 'bigid/bgcheck/server_error'

require 'bigid/bgcheck/request'

module Bigid
  module Bgcheck
    BASE_URL                         = 'https://bigid.bigdatacorp.com.br'
    AUTH_ENDPOINT                    = 'https://accesstoken.bigdatacorp.com.br'
    SRV_ENDPOINT                     = 'backgroundcheck'
    TOKEN_EXPIRATION                 = 60000.freeze
    # Welcome to your new gem!
    # This file is the entry point for your gem. Logic can go in this file, though most gems are big enough to warrant splitting
    # functionality out into multiple files namespaced under a module named the same as a gem.
    # Create those files as lib/bigid_bgcheck/foo as BigidBgcheck::Foo remembering to require each file at the top of this file,
    # unless you want your users to manually require a specific file (for example opt-in feature in a distinct file)
    class << self
      attr_accessor :configuration
    end

    def self.configure
      self.configuration ||= Configuration.new

      yield(configuration)
    end

    class Configuration
      attr_accessor :username, :password

      def initialize
        @username = ''
        @password = ''
      end
    end

    I18n.load_path << Dir[File.expand_path("config/locales") + "/*.yml"]
    I18n.config.available_locales = :en
    I18n.default_locale = :en
  end
end
