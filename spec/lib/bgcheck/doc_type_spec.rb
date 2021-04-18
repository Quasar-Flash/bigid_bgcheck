# frozen_string_literal: true

require "spec_helper"
require "bigid/bgcheck/doc_type"

RSpec.describe Bigid::Bgcheck::DocType do
  describe ".valid?(document_type)" do
    subject { described_class.valid?(document_type) }

    context "when document type is supported" do
      let(:document_type) { described_class::VALUES.sample }

      it { expect(subject).to be_truthy }
    end

    context "when document type is not supported" do
      let(:document_type) { "cnh" }

      it { expect(subject).to be_falsey }
    end
  end

  describe ".values" do
    subject { described_class.values }

    it { expect(subject).to eq(described_class::VALUES) }
  end
end
