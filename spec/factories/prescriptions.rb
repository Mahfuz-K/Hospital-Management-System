# frozen_string_literal: true

# This is factory
FactoryBot.define do
  factory :prescription do
    description { 'paracetamol 650mg' }
    patient
  end
end
