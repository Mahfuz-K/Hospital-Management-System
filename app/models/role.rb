# frozen_string_literal: true

# this is a model
class Role < ApplicationRecord
  has_many :users, dependent: :destroy
  validates :name, presence: { message: "Role can't be null" }
end
