# frozen_string_literal: true

# This is migration file
class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.integer :failed_attempts, default: 0
      t.boolean :is_locked?, default: false
      t.timestamps
    end
  end
end
