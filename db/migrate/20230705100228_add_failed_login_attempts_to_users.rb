class AddFailedLoginAttemptsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :failed_login_attempts, :integer
  end
end
