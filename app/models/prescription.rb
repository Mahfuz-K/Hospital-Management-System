# frozen_string_literal: true

# this is a model
class Prescription < ApplicationRecord
  belongs_to :patient
end
