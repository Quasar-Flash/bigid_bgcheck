module Bigid
  module Bgcheck
    class InternalError < BaseError
      HTTP_STATUS = 400
      STATUS      = 'internal_error'.freeze
      STATUS_CODE = '-1101'.freeze

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
