# frozen_string_literal: true

# This is migration file
class AddAddressToPatients < ActiveRecord::Migration[6.1]
  def change
    add_column :patients, :address, :text
  end
end
