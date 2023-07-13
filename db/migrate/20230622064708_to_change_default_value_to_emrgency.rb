class ToChangeDefaultValueToEmrgency < ActiveRecord::Migration[6.1]
  def change
    change_column_default :patients, :emergency_admission, default: false
  end
end
