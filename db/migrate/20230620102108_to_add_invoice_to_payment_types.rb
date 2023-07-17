# frozen_string_literal: true

# This is migration file
class ToAddInvoiceToPaymentTypes < ActiveRecord::Migration[6.1]
  def change
    add_reference :invoices, :payment_type, foreign_key: true
    add_reference :invoices, :patient, foreign_key: true
  end
end
