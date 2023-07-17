# frozen_string_literal: true

# This is migration file
class To < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :role, foreign_key: true
  end
end
