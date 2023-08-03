# frozen_string_literal: true

# this is a model
class Invoice < ApplicationRecord
  belongs_to :patient
  belongs_to :payment_type

  validates :amount, presence: { message: "Amount can't be null" }, numericality: { greater_than: 0 }
  validates :payment_type_id, presence: true
end
