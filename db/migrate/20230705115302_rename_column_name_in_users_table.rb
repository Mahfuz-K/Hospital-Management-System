class RenameColumnNameInUsersTable < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :is_locked?, :is_locked
  end
end
