# frozen_string_literal: true

# This is Spec
require 'rails_helper'

RSpec.describe Prescription, type: :model do
  let(:prescription) { FactoryBot.build(:prescription) }

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(prescription).to be_valid
    end

    it 'is not valid without an amount' do
      prescription.description = nil
      expect(prescription).not_to be_valid
    end
  end
end
