# frozen_string_literal: true

module Bigid
  module Bgcheck
    class Result
      attr_accessor :approved, :code, :score_details, :limit_score, :message, :raw_data,
                    :raw_response, :related_score_details, :score, :ticket_id

      def initialize(approved:, code:, score_details:, limit_score:, message:, raw_data:, raw_response:,
                     related_score_details:, score:, ticket_id:)
        @approved              = approved
        @code                  = code
        @score_details         = score_details
        @limit_score           = limit_score
        @message               = message
        @raw_data              = raw_data
        @raw_response          = raw_response
        @related_score_details = related_score_details
        @score                 = score
        @ticket_id             = ticket_id
      end
    end
  end
end
