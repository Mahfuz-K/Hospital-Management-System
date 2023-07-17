# frozen_string_literal: true

# This is Spec

require 'rails_helper'

RSpec.describe BedType, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      bed_type = FactoryBot.build(:bed_type)
      expect(bed_type).to be_valid
    end

    it 'is not valid without a body' do
      bed_type = FactoryBot.build(:bed_type)
      bed_type.name = nil
      expect(bed_type).not_to be_valid
    end
  end
end
