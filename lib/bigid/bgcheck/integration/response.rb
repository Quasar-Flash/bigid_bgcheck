# frozen_string_literal: true

module Bigid
  module Bgcheck
    module Integration
      class Response
        attr_reader :request, :status, :headers, :body, :time

        def initialize(attributes)
          @request = attributes.fetch(:request)
          @status = attributes.fetch(:status)
          @headers = attributes[:headers] || {}
          @body = attributes[:body] || {}
          @time = attributes[:time] || Time.current
        end

        def success?
          @status.between?(200, 299)
        end

        def error?
          !success?
        end
      end
    end
  end
end
