# frozen_string_literal: true

# This is category_Spec
require 'rails_helper'

RSpec.describe Invoice, type: :model do
  let(:invoice) { FactoryBot.build(:invoice) }

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(invoice).to be_valid
    end

    it 'is not valid without an amount' do
      invoice.amount = nil
      expect(invoice).not_to be_valid
    end
  end
end
