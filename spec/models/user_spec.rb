# frozen_string_literal: true

# This is Spec
require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.build(:user) }

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(user).to be_valid
    end

    it 'is not valid without an amount' do
      user.username = nil
      expect(user).not_to be_valid
    end
    it 'is not valid without an amount' do
      user.email = nil
      expect(user).not_to be_valid
    end
  end
end
