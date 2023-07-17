# frozen_string_literal: true

# This is migration file
class CreatePaymentTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :payment_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
