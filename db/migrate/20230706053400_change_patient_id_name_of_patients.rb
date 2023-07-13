class ChangePatientIdNameOfPatients < ActiveRecord::Migration[6.1]
  def change
            rename_column :patients, :patient_id_generated, :patient_id
  end
end
