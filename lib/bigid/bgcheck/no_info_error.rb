# frozen_string_literal: true

module Bigid
  module Bgcheck
    class NoInfoError < BaseError
      HTTP_STATUS = 200
      STATUS      = "no_info_error"
      STATUS_CODE = "-1102"

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
