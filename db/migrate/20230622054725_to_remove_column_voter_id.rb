# frozen_string_literal: true

# This is migration file
class ToRemoveColumnVoterId < ActiveRecord::Migration[6.1]
  def change
    remove_column :patients, :voter_id, :string
  end
end
