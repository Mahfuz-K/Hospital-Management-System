class AddNotNullConstraintsToInvoices < ActiveRecord::Migration[6.1]
  def change
    change_column :invoices, :amount, :integer, null: false

  end
end
