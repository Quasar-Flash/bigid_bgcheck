# frozen_string_literal: true

module Bigid
  module Bgcheck
    class DocType
      VALUES = %w[CPF CNPJ].freeze

      def self.valid?(document_type)
        VALUES.include?(document_type.upcase)
      end

      def self.values
        VALUES
      end
    end
  end
end
