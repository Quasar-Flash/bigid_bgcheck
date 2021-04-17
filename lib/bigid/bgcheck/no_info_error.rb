module Bigid
  module Bgcheck
    class NoInfoError < BaseError
      HTTP_STATUS = 200
      STATUS      = 'no_info_error'.freeze
      STATUS_CODE = '-1102'.freeze

      def http_status
        HTTP_STATUS
      end

      def status
        STATUS
      end

      def status_code
        STATUS_CODE
      end
    end
  end
end
