# frozen_string_literal: true

require "faraday"
require "i18n"
require "json"

require "bigid/bgcheck/version"

require "bigid/bgcheck/integration/multipart_flat"
require "bigid/bgcheck/integration/response"
require "bigid/bgcheck/integration/request"
require "bigid/bgcheck/integration/connection"

require "bigid/bgcheck/auth/connection"
require "bigid/bgcheck/auth/authentication"
require "bigid/bgcheck/auth/authenticated_resource"
require "bigid/bgcheck/auth/authenticated_connection"

require "bigid/bgcheck/base_error"
require "bigid/bgcheck/bad_request_error"
require "bigid/bgcheck/document_not_supported_error"
require "bigid/bgcheck/internal_error"
require "bigid/bgcheck/invalid_credentials_error"
require "bigid/bgcheck/no_info_error"
require "bigid/bgcheck/server_error"

require "bigid/bgcheck/doc_type"
require "bigid/bgcheck/result"
require "bigid/bgcheck/result_code"

require "bigid/bgcheck/request"

module Bigid
  module Bgcheck
    BASE_URL                         = "https://bigid.bigdatacorp.com.br"
    AUTH_ENDPOINT                    = "https://accesstoken.bigdatacorp.com.br"
    SRV_ENDPOINT                     = "backgroundcheck"
    TOKEN_EXPIRATION                 = 60_000

    class << self
      attr_writer :configuration

      def configuration
        @configuration ||= Configuration.new
      end
    end

    def self.configure
      self.configuration ||= Configuration.new

      yield(configuration)
    end

    class Configuration
      attr_writer :username, :password

      def username
        @username ||= ENV["BIGID_USERNAME"]
      end

      def password
        @password ||= ENV["BIGID_PASSWORD"]
      end
    end

    I18n.load_path << Dir["#{File.expand_path('config/locales')}/*.yml"]
    I18n.config.available_locales = :en, :'pt-BR'
    I18n.default_locale = :en
  end
end
