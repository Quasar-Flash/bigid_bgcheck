# frozen_string_literal: true

module Bigid
  module Bgcheck
    class Request < Bigid::Auth::AuthenticatedResource
      def call(document:, document_type:, group:)
        res = @connection.post(url: Bigid::Bgcheck::SRV_ENDPOINT,
                               body: payload(document, document_type, group).to_json)

        check_status(res.status)

        parse_response_body(res.body)
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
          login = Bigid.configuration.username
          document_type = document_type.upcase.strip

          raise Bigid::Bgcheck::DocumentNotSupportedError unless DocType.valid?(document_type)

          parameters[:"#{document_type}"] = document

          { Login: login, parameters: parameters, Group: group }
        end

        def check_result_code(code)
          raise Bigid::Bgcheck::InvalidDocumentValueError unless code
          raise Bigid::Bgcheck::NoInfoError if ResultCode.no_info?(code)
        end

        def parse_response_body(body)
          body = JSON.parse(body)

          check_result_code(body["ResultCode"])

          Bigid::Bgcheck::Result.new(
            approved: ResultCode.approved?(body["ResultCode"]),
            code: body["ResultCode"],
            score_details: body["ScoreDetails"],
            limit_score: body["LimitScore"],
            message: body["ResultMessage"],
            raw_data: body["RawData"],
            raw_response: body.to_json,
            related_score_details: body["RelatedScoreDetails"],
            score: body["Score"],
            ticket_id: body["TicketId"]
          )
        end
    end
  end
end
