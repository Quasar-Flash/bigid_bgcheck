# frozen_string_literal: true

RSpec.describe Bigid::Bgcheck::Request do
  describe "#call" do
    let(:connection) { instance_double(Bigid::Auth::AuthenticatedConnection) }
    let(:body) {
      {
        Login: "username_value",
        parameters: { CNPJ: document },
        Group: group
      }.to_json
    }
    let(:success_result) { build(:result, :approved) }
    let(:success_result_response) {
      JSON.parse({
        body: {
          RawData: success_result.raw_data,
          ScoreDetails: success_result.score_details,
          RelatedScoreDetails: success_result.related_score_details,
          LimitScore: success_result.limit_score,
          ResultCode: success_result.code,
          ResultMessage: success_result.message,
          Score: success_result.score,
          TicketId: success_result.ticket_id
        }.to_json,
        status: request_status
      }.to_json, object_class: OpenStruct)
    }
    let(:document) { CNPJ.generate }
    let(:document_type) { "CNPJ" }
    let(:group) { "Default" }
    let(:request_status) { 200 }

    subject { described_class.new.call(document: document, document_type: document_type, group: group) }

    before do
      allow(Bigid::Auth::AuthenticatedConnection).to receive(:new).and_return(connection)
      allow(connection).to receive(:post).and_return(success_result_response)
    end

    describe ".call" do
      subject { described_class.call(document: document, document_type: document_type, group: group) }

      it { expect(subject).to be_kind_of(Bigid::Bgcheck::Result) }

      it { subject; expect(connection).to have_received(:post) }
    end

    context "when all parameters are valid" do
      it { expect(subject).to be_kind_of(Bigid::Bgcheck::Result) }

      it { subject; expect(connection).to have_received(:post) }
    end

    context "when document type is invalid" do
      let(:document_type) { "CNP" }

      it { expect { subject }.to raise_error(Bigid::Bgcheck::DocumentNotSupportedError) }
    end

    context "when request status is null" do
      let(:request_status) { nil }

      it { expect { subject }.to raise_error(Bigid::Bgcheck::InternalError) }
    end

    context "when request status is server error" do
      let(:request_status) { 500 }

      it { expect { subject }.to raise_error(Bigid::Bgcheck::ServerError) }
    end

    context "when request status is auth error" do
      let(:request_status) { 401 }

      it { expect { subject }.to raise_error(Bigid::Bgcheck::InvalidCredentialsError) }
    end

    context "when request status is bad request" do
      let(:request_status) { 400 }

      it { expect { subject }.to raise_error(Bigid::Bgcheck::BadRequestError) }
    end

    context "when the result code is empty" do
      let(:success_result) { build(:result, :approved, code: nil) }

      it { expect { subject }.to raise_error(Bigid::Bgcheck::InvalidDocumentValueError) }
    end

    context "when the result code is empty" do
      let(:success_result) { build(:result, :approved, code: Bigid::Bgcheck::ResultCode::NO_INFO) }

      it { expect { subject }.to raise_error(Bigid::Bgcheck::NoInfoError) }
    end
  end
end
