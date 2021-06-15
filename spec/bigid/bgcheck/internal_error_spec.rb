# frozen_string_literal: true

require "spec_helper"

RSpec.describe Bigid::Bgcheck::InternalError do
  include_examples "http_error"
end
