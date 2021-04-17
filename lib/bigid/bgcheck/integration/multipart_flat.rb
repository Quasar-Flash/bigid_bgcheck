module Bigid
  module Bgcheck
    module Integration
      class MultipartFlat < Faraday::Request::Multipart
        self.mime_type = 'multipart/form-data'.freeze
        DEFAULT_BOUNDARY_PREFIX = "-----------RubyMultipartPost".freeze unless defined? DEFAULT_BOUNDARY_PREFIX

        def process_params(params, prefix = nil, pieces = nil, &block)
          params.inject(pieces || []) do |all, (key, value)|
            key = "#{prefix}" if prefix

            case value
            when Array
              values = value.inject([]) { |a,v| a << [nil, v] }
              process_params(values, key, all, &block)
            when Hash
              process_params(value, key, all, &block)
            else
              all << block.call(key, value)
            end
          end
        end
      end
    end
  end
end
