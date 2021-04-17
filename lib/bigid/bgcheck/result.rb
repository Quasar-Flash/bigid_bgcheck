module Bigid
  module Bgcheck
    class Result
      attr_accessor :approved, :ticket_id, :code, :message, :score, :limit_score

      def initialize(approved:, ticket_id:, code:, message:, score:, limit_score:)
        @approved    = approved
        @ticket_id   = ticket_id
        @code        = code
        @message     = message
        @score       = score
        @limit_score = limit_score
      end
    end
  end
end
