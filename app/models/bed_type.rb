# frozen_string_literal: true

# this is a model
class BedType < ApplicationRecord
  has_many :patients
end
