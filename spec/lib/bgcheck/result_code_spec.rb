# frozen_string_literal: true

require "spec_helper"

RSpec.describe Bigid::Bgcheck::ResultCode do
  describe ".valid?(code)" do
    subject { described_class.valid?(code) }

    context "when code is valid" do
      let(:code) { described_class::VALUES.sample }

      it { expect(subject).to be_truthy }
    end

    context "when code is not valid" do
      let(:code) { 9999 }

      it { expect(subject).to be_falsey }
    end

    context "when code is a string" do
      let(:code) { "error" }

      it { expect(subject).to be_falsey }
    end
  end

  describe ".values" do
    subject { described_class.values }

    it { expect(subject).to eq(described_class::VALUES) }
  end

  describe ".approved?(code)" do
    subject { described_class.approved?(code) }

    context "when code is approved" do
      let(:code) { described_class::APPROVED }

      it { expect(subject).to be_truthy }
    end

    context "when code is not valid" do
      let(:code) { 0 }

      it { expect(subject).to be_falsey }
    end

    context "when code is a string" do
      let(:code) { "error" }

      it { expect(subject).to be_falsey }
    end
  end

  describe ".no_info?(code)" do
    subject { described_class.no_info?(code) }

    context "when code is no_info" do
      let(:code) { described_class::NO_INFO }

      it { expect(subject).to be_truthy }
    end

    context "when code is not valid" do
      let(:code) { 0 }

      it { expect(subject).to be_falsey }
    end

    context "when code is a string" do
      let(:code) { "error" }

      it { expect(subject).to be_falsey }
    end
  end
end
