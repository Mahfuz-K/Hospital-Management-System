class CreatePatients < ActiveRecord::Migration[6.1]
  def change
    create_table :patients do |t|
      t.string :name
      t.string :phone_no
      t.string :email
      t.string :sex
      t.date :DOB
      t.string :emergency_contact_person_name
      t.string :emergency_contact_person_number
      t.string :emrgency_contact_person_email_id
      t.integer :patient_id
      t.integer :bed_number
      t.boolean :emergency_admission
      t.string :voter_id

      t.timestamps
    end
  end
end
