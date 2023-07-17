# frozen_string_literal: true

# This is migration file
class ToChangeDefaultToEmrgency < ActiveRecord::Migration[6.1]
  def change
    change_column_default :patients, :emergency_admission, default: false
  end
end
