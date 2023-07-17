# frozen_string_literal: true

# This is Spec

require 'rails_helper'
# rubocop:disable Metrics/BlockLength
RSpec.describe Patient, type: :model do
  let(:patient) { FactoryBot.build(:patient) }

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(patient).to be_valid
    end

    it 'is not valid without a name' do
      patient.name = nil
      expect(patient).not_to be_valid
    end

    it 'is not valid without an email' do
      patient.email = nil
      expect(patient).not_to be_valid
    end

    it 'is not valid with an invalid phone number length' do
      patient.phone_no = '123'
      expect(patient).not_to be_valid
    end

    it 'is not valid without a sex' do
      patient.sex = nil
      expect(patient).not_to be_valid
    end

    it 'is not valid without a date of birth' do
      patient.date_of_birth = nil
      expect(patient).not_to be_valid
    end

    it 'is not valid without an address' do
      patient.address = nil
      expect(patient).not_to be_valid
    end

    it 'is not valid without an age' do
      patient.age = nil
      expect(patient).not_to be_valid
    end

    it 'is not valid without an emergency contact person email' do
      patient.emergency_contact_person_email_id = nil
      expect(patient).not_to be_valid
    end

    it 'is not valid without an emergency contact person number' do
      patient.emergency_contact_person_number = nil
      expect(patient).not_to be_valid
    end

    it 'is not valid without an emergency contact person name' do
      patient.emergency_contact_person_name = nil
      expect(patient).not_to be_valid
    end
  end
end
# rubocop:enable Metrics/BlockLength
