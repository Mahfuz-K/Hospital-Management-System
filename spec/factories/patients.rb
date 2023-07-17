# frozen_string_literal: true

# This is patients_factory
FactoryBot.define do
  factory :patient do
    name { 'Shatrujit Bera' }
    phone_no { '1234567890' }
    email { 'Shatrujit@gmail.com' }
    sex { 'Male' }
    address { 'Kolkata' }
    age { 30 }
    date_of_birth { Date.today - 20.years }
    emergency_contact_person_name { 'Emergency Contact' }
    emergency_contact_person_number { '9876543210' }
    emergency_contact_person_email_id { 'emergency@gmail.com' }
    bed_type
  end
end
