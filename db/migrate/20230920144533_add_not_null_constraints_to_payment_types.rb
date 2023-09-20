class AddNotNullConstraintsToPaymentTypes < ActiveRecord::Migration[6.1]
  def change
    change_column :payment_types, :name, :string, null: false
  end
end
