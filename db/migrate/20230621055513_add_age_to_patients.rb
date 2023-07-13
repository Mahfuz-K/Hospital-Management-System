class AddAgeToPatients < ActiveRecord::Migration[6.1]
  def change
    add_column :patients, :age, :integer
  end
end
