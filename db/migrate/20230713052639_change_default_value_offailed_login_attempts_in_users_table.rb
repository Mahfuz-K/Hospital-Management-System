class ChangeDefaultValueOffailedLoginAttemptsInUsersTable < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :failed_login_attempts, :integer, default: 0
  end
end
