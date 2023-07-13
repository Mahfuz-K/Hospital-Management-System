class ToAddPrescriptionToPatient < ActiveRecord::Migration[6.1]
  def change
    add_reference :prescriptions, :patient, add_foreign_key: true
  end
end
