# frozen_string_literal: true

# This is migration file
class CreateInvoices < ActiveRecord::Migration[6.1]
  def change
    create_table :invoices do |t|
      t.integer :amount
      t.timestamps
    end
  end
end
