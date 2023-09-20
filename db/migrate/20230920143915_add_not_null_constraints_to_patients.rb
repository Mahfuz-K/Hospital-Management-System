class AddNotNullConstraintsToPatients < ActiveRecord::Migration[6.1]
  def change
    change_column :patients, :name, :string, null: false
    change_column :patients, :phone_no, :string, null: false
    change_column :patients, :email, :string, null: false
    change_column :patients, :sex, :string, null: false
    change_column :patients, :date_of_birth, :date, null: false
    change_column :patients, :emergency_contact_person_name, :string, null: false
    change_column :patients, :emergency_contact_person_number, :string, null: false
    change_column :patients, :emergency_contact_person_email_id, :string, null: false
    change_column :patients, :patient_id, :integer, null: false
    change_column :patients, :bed_number, :integer, null: false
    change_column :patients, :bed_type_id, :bigint, null: false
    change_column :patients, :address, :text, null: false
    change_column :patients, :age, :integer, null: false

  end
end
