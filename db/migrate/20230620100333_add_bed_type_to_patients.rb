# frozen_string_literal: true

# This is migration file
class AddBedTypeToPatients < ActiveRecord::Migration[6.1]
  def change
    add_reference :patients, :bed_type, foreign_key: true
  end
end
