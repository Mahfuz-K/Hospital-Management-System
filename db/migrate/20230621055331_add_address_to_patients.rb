class AddAddressToPatients < ActiveRecord::Migration[6.1]
  def change
    add_column :patients, :address, :text
  end
end
