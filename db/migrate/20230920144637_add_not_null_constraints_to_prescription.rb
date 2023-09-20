class AddNotNullConstraintsToPrescription < ActiveRecord::Migration[6.1]
  def change
    change_column :prescriptions, :description, :text, null: false

  end
end
