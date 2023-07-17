# frozen_string_literal: true

# This is migration file
class AddNewColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :confirmed, :boolean, default: false
  end
end
