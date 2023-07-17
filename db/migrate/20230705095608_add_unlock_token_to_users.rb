# frozen_string_literal: true

# This is migration file
class AddUnlockTokenToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :unlock_token, :string
  end
end
