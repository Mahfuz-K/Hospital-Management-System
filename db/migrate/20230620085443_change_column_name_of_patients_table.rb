class ChangeColumnNameOfPatientsTable < ActiveRecord::Migration[6.1]
  def change
    rename_column :patients, :emrgency_contact_person_email_id, :emergency_contact_person_email_id
    rename_column :patients, :patient_id, :patient_id_generated
  end
end
