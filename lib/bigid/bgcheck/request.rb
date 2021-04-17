module Bigid
  module Bgcheck
    class Request < Bigid::Bgcheck::Auth::AuthenticatedResource
      VALID_DOCUMENTS = %w[CPF CNPJ].freeze

      APPROVED = 90.freeze
      NOT_APPROVED = -1100.freeze
      ERROR = -1101.freeze
      NO_INFO = -1102.freeze

      def call(document:, document_type:, group:)
        res = @connection.post(url: Bigid::Bgcheck::SRV_ENDPOINT, body: payload(document, document_type, group).to_json)

        check_status(res.status)

        return parse_response_body(res.body)
      end

      def self.call(document:, document_type:, group:)
        new.call(document: document, document_type: document_type, group: group)
      end

      private

      def check_status(status)
        raise Bigid::Bgcheck::InternalError unless status
        raise Bigid::Bgcheck::ServerError if status == 500
        raise Bigid::Bgcheck::InvalidCredentialsError if status == 401
        raise Bigid::Bgcheck::BadRequestError if status == 400
      end

      def payload(document, document_type, group, parameters = {})
        login = Bigid::Bgcheck.configuration&.username || ENV['BIGID_USERNAME']
        document_type = document_type.upcase.strip

        if !VALID_DOCUMENTS.include?(document_type)
          raise Bigid::Bgcheck::DocumentNotSupportedError
        end

        parameters[:"#{document_type}"] = document

        { Login: login, parameters: parameters, Group: group }
      end

      def check_result_code(code)
        raise Bigid::Bgcheck::InvalidDocumentValueError unless code
        raise Bigid::Bgcheck::NoInfoError if code == NO_INFO
      end

      def parse_response_body(body)
        body = JSON.parse(body)

        check_result_code(body['ResultCode'])

        Bigid::Bgcheck::Result.new(
          approved: body['ResultCode'] == APPROVED,
          ticket_id: body['TicketId'],
          code: body['ResultCode'],
          message: body['ResultMessage'],
          score: body['Score'],
          limit_score: body['LimitScore']
        )
      rescue StandardError
        raise Bigid::Bgcheck::InternalError
      end
    end
  end
end
