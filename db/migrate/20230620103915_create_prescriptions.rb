# frozen_string_literal: true

# This is migration file
class CreatePrescriptions < ActiveRecord::Migration[6.1]
  def change
    create_table :prescriptions do |t|
      t.text :description

      t.timestamps
    end
  end
end
