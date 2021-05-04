# frozen_string_literal: true

require "spec_helper"

RSpec.describe Bigid::Bgcheck do
  describe "SRV_ENDPOINT" do
    subject { defined? Bigid::Bgcheck::SRV_ENDPOINT }

    it { expect(subject).to be_truthy }
  end

  describe ".configure" do
    before do
      Bigid.configuration = nil
      ENV.clear
    end

    subject { Bigid.configuration }

    context "when configuration is defined" do
      before do
        Bigid.configure do |config|
          config.username = "username_value"
          config.password = "password_value"
        end
      end

      it { expect(subject).not_to be_nil }

      it { expect(subject.username).to eq("username_value") }

      it { expect(subject.password).to eq("password_value") }
    end

    context "when configuration is not defined" do
      it { expect(subject).not_to be_nil }

      it { expect(subject.username).to be_nil }

      it { expect(subject.password).to be_nil }
    end

    context "when its configured by envs" do
      before do
        ENV["BIGID_USERNAME"] = "username_value"
        ENV["BIGID_PASSWORD"] = "password_value"
      end

      it { expect(subject).not_to be_nil }

      it { expect(subject.username).to eq("username_value") }

      it { expect(subject.password).to eq("password_value") }
    end

    context "when its envs configured and configs setted" do
      before do
        ENV["BIGID_USERNAME"] = "username_value"
        ENV["BIGID_PASSWORD"] = "password_value"

        Bigid.configure do |config|
          config.username = "username_value2"
          config.password = "password_value2"
        end
      end

      it { expect(subject).not_to be_nil }

      it { expect(subject.username).to eq("username_value2") }

      it { expect(subject.password).to eq("password_value2") }
    end

    describe "I18n calls" do
      it { expect(I18n.default_locale).to eq(:en) }

      it { expect(I18n.config.available_locales).to contain_exactly(:en, :'pt-BR') }
    end
  end
end
