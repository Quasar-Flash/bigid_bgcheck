# frozen_string_literal: true

module Bigid
  module Bgcheck
    class ResultCode
      APPROVED = 90
      ERROR = -1101
      NO_INFO = -1102
      NOT_APPROVED = -1100

      VALUES = [APPROVED, NOT_APPROVED, ERROR, NO_INFO].freeze

      def self.valid?(code)
        VALUES.include?(code.to_i)
      end

      def self.values
        VALUES
      end

      def self.approved?(code)
        code.to_i == APPROVED
      end

      def self.no_info?(code)
        code.to_i == NO_INFO
      end
    end
  end
end
