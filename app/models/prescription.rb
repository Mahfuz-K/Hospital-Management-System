# frozen_string_literal: true

# this is a model
class Prescription < ApplicationRecord
  belongs_to :patient
  validates :description, presence: { message: "Prescription can't be null" }
end
