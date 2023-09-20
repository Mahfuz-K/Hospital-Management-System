class AddNotNullConstraintsToBedTypes < ActiveRecord::Migration[6.1]
  def change
    change_column :bed_types, :name, :string, null: false

  end
end
