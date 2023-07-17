# frozen_string_literal: true

# This is Spec
require 'rails_helper'

RSpec.describe PaymentType, type: :model do
  let(:payment_type) { FactoryBot.build(:payment_type) }

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(payment_type).to be_valid
    end

    it 'is not valid without an amount' do
      payment_type.name = nil
      expect(payment_type).not_to be_valid
    end
  end
end
