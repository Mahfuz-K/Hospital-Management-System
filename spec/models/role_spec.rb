# frozen_string_literal: true

# This is Spec
require 'rails_helper'

RSpec.describe Role, type: :model do
  let(:role) { FactoryBot.build(:role) }

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(role).to be_valid
    end

    it 'is not valid without an amount' do
      role.name = nil
      expect(role).not_to be_valid
    end
  end
end
