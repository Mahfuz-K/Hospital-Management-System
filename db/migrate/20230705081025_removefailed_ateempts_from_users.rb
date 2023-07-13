class RemovefailedAteemptsFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :failed_attempts
  end
end
