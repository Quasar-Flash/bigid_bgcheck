# frozen_string_literal: true

module Bigid
  module Bgcheck
    class InternalError < BaseError
      HTTP_STATUS = 400
      STATUS      = "internal_error"
      STATUS_CODE = "-1101"

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
