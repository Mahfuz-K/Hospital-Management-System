class ChangeDateName < ActiveRecord::Migration[6.1]
  def change
    rename_column :patients, :DOB, :date_of_birth
  end
end
