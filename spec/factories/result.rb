# frozen_string_literal: true

FactoryBot.define do
  factory :result, class: "Bigid::Bgcheck::Result" do
    trait :approved do
      approved { true }
      code { Bigid::Bgcheck::ResultCode::APPROVED }
      score_details { {} }
      limit_score { 10.0 }
      message { "Approved" }
      score { 10.0 }
      ticket_id { SecureRandom.hex(8) }
      raw_data { "{}" }
      raw_response { "{\"ScoreDetails\":#{score_details},\"LimitScore\":#{limit_score},\"ResultCode\":#{code},\"ResultMessage\":\"#{message}\",\"Score\":#{score},\"TicketId\":\"#{ticket_id}\"}" }
      related_score_details { "{}" }
    end

    trait :unapproved do
      approved { false }
      code { Bigid::Bgcheck::ResultCode::NOT_APPROVED }
      score_details { }
      limit_score { 10.0 }
      message { "Not Approved" }
      raw_response { "{\"ScoreDetails\":null,\"LimitScore\":10.0,\"ResultCode\":90,\"ResultMessage\":\"Approved\",\"Score\":10.0,\"TicketId\":\"d735711aeb909de9\"}" }
      score { 1.0 }
      ticket_id { SecureRandom.hex(8) }
    end

    initialize_with do
      new(
        approved: approved,
        code: code,
        score_details: score_details,
        limit_score: limit_score,
        message: message,
        raw_data: raw_data,
        raw_response: raw_response,
        related_score_details: related_score_details,
        score: score,
        score_details: score_details,
        ticket_id: ticket_id
      )
    end
  end
end
