# frozen_string_literal: true

# This is factory
FactoryBot.define do
  factory :invoice do
    amount { 12_000 }
    patient
    payment_type
  end
end
