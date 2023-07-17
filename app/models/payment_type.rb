# frozen_string_literal: true

# this is a model
class PaymentType < ApplicationRecord
  has_many :invoices
  validates :name, presence: { message: "Payment Type can't be null" }
end
