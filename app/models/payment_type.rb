# frozen_string_literal: true

# this is a model
class PaymentType < ApplicationRecord
  has_many :invoices
end
