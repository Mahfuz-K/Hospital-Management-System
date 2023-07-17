# frozen_string_literal: true

# This is migration file
class AddAgeToPatients < ActiveRecord::Migration[6.1]
  def change
    add_column :patients, :age, :integer
  end
end
