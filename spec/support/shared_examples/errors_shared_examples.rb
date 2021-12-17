# frozen_string_literal: true

RSpec.shared_examples "error" do
  describe ".initialize" do
    context "when message parameter is null" do
      subject { described_class.new.message }

      it { expect(subject).to eq(described_class.default_message) }
    end

    context "when message parameter is not null" do
      subject { described_class.new(message).message }

      let(:message) { "message" }

      it { expect(subject).to eq(message) }
    end
  end

  describe ".default_message" do
    let(:expected_result) { I18n.t("errors.#{described_class.name.underscore.tr("/", ".")}") }

    subject { described_class.default_message }

    it "searches the default message in I18n using the class name" do
      expect(subject).to eq(expected_result)
    end
  end
end

RSpec.shared_examples "http_error" do
  include_examples "error"

  describe "#http_status" do
    subject { described_class.new.http_status }

    it { expect(subject).to eq(described_class::HTTP_STATUS) }
  end

  describe "#status" do
    subject { described_class.new.status }

    it { expect(subject).to eq(described_class::STATUS) }
  end

  describe "#status_code" do
    subject { described_class.new.status_code }

    it { expect(subject).to eq(described_class::STATUS_CODE) }
  end
end
