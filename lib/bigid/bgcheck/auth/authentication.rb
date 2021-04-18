# frozen_string_literal: true

module Bigid
  module Bgcheck
    module Auth
      class Authentication
        def initialize(connection: Connection.new,
                       username: Bigid::Bgcheck.configuration.username,
                       password: Bigid::Bgcheck.configuration.password,
                       token_expiration_time_in_seconds: Bigid::Bgcheck::AUTH_ENDPOINT)
          @connection = connection
          @token_expiration_time_in_seconds = Bigid::Bgcheck::TOKEN_EXPIRATION
          @username = username
          @password = password
        end

        def login
          res = @connection.post(url: "Generate", body: login_body)

          return res if res.status == 200

          raise Bigid::Bgcheck::InvalidCredentialsError if res.status == 401
          raise Bigid::Bgcheck::BadRequestError if res.status == 400
          raise Bigid::Bgcheck::ServerError if res.status == 500
        end

        private
          def login_body
            {
              login: @username,
              password: @password,
              expires: @token_expiration_time_in_seconds.to_i
            }.to_json
          end
      end
    end
  end
end
