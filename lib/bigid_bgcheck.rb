# frozen_string_literal: true

require "i18n"
require "json"
require "cpf_cnpj"

require "bigid_auth"

require "bigid/bgcheck/version"

require "bigid/bgcheck/base_error"
require "bigid/bgcheck/bad_request_error"
require "bigid/bgcheck/document_not_supported_error"
require "bigid/bgcheck/internal_error"
require "bigid/bgcheck/invalid_credentials_error"
require "bigid/bgcheck/invalid_document_value_error"
require "bigid/bgcheck/no_info_error"
require "bigid/bgcheck/server_error"

require "bigid/bgcheck/doc_type"
require "bigid/bgcheck/result"
require "bigid/bgcheck/result_code"
require "bigid/bgcheck/request"

I18n.load_path += Dir[File.join(__dir__, "locales", "**/*.yml")]
I18n.reload! if I18n.backend.initialized?

module Bigid
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
  end

  module Bgcheck
    SRV_ENDPOINT = "backgroundcheck"
  end
end
