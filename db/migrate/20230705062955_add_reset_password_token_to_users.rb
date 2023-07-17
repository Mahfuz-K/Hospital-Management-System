# frozen_string_literal: true

# This is migration file
class AddResetPasswordTokenToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :reset_password_token, :string
  end
end
