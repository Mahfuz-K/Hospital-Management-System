# frozen_string_literal: true

# this is a model
class BedType < ApplicationRecord
  has_many :patients, dependent: :destroy
  validates :name, presence: { message: "Bed Type can't be null" }
end
