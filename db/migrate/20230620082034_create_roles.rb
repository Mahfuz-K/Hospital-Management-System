# frozen_string_literal: true

# This is migration file
class CreateRoles < ActiveRecord::Migration[6.1]
  def change
    create_table :roles do |t|
      t.string :name
      t.timestamps
    end
  end
end
