# frozen_string_literal: true

# This is migration file
class RenameColumnNameInUsersTable < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :is_locked?, :is_locked
  end
end
