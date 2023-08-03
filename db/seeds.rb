# rubocop:disable all
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
role1 = Role.create(name: 'Admin')
role2 = Role.create(name: 'Staff')

User.create(username: 'Mahfuz Alam', email: 'Mahfuzflamedestiny@gmail.com', password: '1234', role_id: role1.id,
            confirmed: true, first_login: false)
User.create(username: 'Gaurav Pareek', email: 'gppareek22@gmail.com', password: '1234', role_id: role2.id,
            first_login: false)
User.create(username: 'Lokesh kumar', email: 'lokeshkumarchaman@gmail.com', password: '1234', role_id: role2.id,
            first_login: false)
User.create(username: 'Jabra Ram', email: 'jrchoudhary2410@gmail.com', password: '1234',
            role_id: role2.id, first_login: false)

bed_type1 = BedType.create(name: 'General Ward')
bed_type2 = BedType.create(name: 'ICU')
bed_type3 = BedType.create(name: 'Private Ward')

patient1 = Patient.new(name: 'Mahfuz Alam', email: 'Mahfuzalamdestiny@gmail.com', sex: 'Male',
                          date_of_birth: Date.new(1990, 10, 15),phone_no:8765432312, emergency_contact_person_name: 'Gourav Pareek', emergency_contact_person_email_id: 'gppareek22@gmail.com', emergency_contact_person_number: '8767899809', bed_type_id: 1, bed_number: 101, patient_id: 111111, address: 'Kolkata', age: 33)
image_paths = ['voter_id_1.jpeg', 'voter_id_2.jpg']
image_paths.each do |image_path|
  path = Rails.root.join('app', 'assets', 'images', image_path)
  patient1.voter_id.attach(io: File.open(path), filename: image_path)
end
patient1.save
patient2 = Patient.new(name: 'Lokesh Chaman', email: 'lokeshkumarchaman@gmail.com', sex: 'Male',
                          date_of_birth: Date.new(1991, 10, 15),phone_no:8765432312, emergency_contact_person_name: 'Gourav Pareek', emergency_contact_person_email_id: 'gppaeek22@gmail.com', emergency_contact_person_number: '8767899809', bed_type_id: 2, bed_number: 102, patient_id: 2_222_222, address: 'Kolkata', age: 33)
image_paths = ['voter_id_1.jpeg', 'voter_id_2.jpg']
image_paths.each do |image_path|
  path = Rails.root.join('app', 'assets', 'images', image_path)
  patient2.voter_id.attach(io: File.open(path), filename: image_path)
end
patient2.save
patient3 = Patient.new(name: 'Lokesh Kumar', email: 'lokesh.chaman@kreeti.com', sex: 'Male',
                          date_of_birth: Date.new(1990, 10, 15),phone_no:8765432312, emergency_contact_person_name: 'Gourav Pareek', emergency_contact_person_email_id: 'gpareek22@gmail.com', emergency_contact_person_number: '8767899809', bed_type_id:2, bed_number: 103, patient_id: 333_333, address: 'Jaipur', age: 25)
image_paths = ['voter_id_1.jpeg', 'voter_id_2.jpg']
image_paths.each do |image_path|
  path = Rails.root.join('app', 'assets', 'images', image_path)
  patient3.voter_id.attach(io: File.open(path), filename: image_path)
end
patient3.save
patient4 = Patient.new(name: 'Jabra Ram', email: 'jrchoudhary2410@gmail.com', sex: 'Male',
                          date_of_birth: Date.new(1991, 10, 15),phone_no:8765432312, emergency_contact_person_name: 'Gourav Pareek', emergency_contact_person_email_id: 'ppareek22@gmail.com', emergency_contact_person_number: '8767899809', bed_type_id: 3, bed_number: 104, patient_id: 444_444, address: 'Jaipur', age: 25)
image_paths = ['voter_id_1.jpeg', 'voter_id_2.jpg']
image_paths.each do |image_path|
  path = Rails.root.join('app', 'assets', 'images', image_path)
  patient4.voter_id.attach(io: File.open(path), filename: image_path)
end
patient4.save
patient5 = Patient.new(name: 'Azad Sing', email: 'azad@gmail.com', sex: 'Male', date_of_birth: Date.new(1999, 10, 15),phone_no:8765432312,
                          emergency_contact_person_name: 'Gourav Pareek', emergency_contact_person_email_id: 'gpparee22@gmail.com', emergency_contact_person_number: '8767899809', bed_type_id: 3, bed_number: 105, patient_id: 555_555, address: 'Kolkata', age: 23)
image_paths = ['voter_id_1.jpeg', 'voter_id_2.jpg']
image_paths.each do |image_path|
  path = Rails.root.join('app', 'assets', 'images', image_path)
  patient5.voter_id.attach(io: File.open(path), filename: image_path)
end
patient5.save
patient6 = Patient.new(name: 'Madiha Mallick', email: 'mallickmadiha9031@gmail.com', sex: 'Female',
                          date_of_birth: Date.new(1999, 10, 15),phone_no:8765432312, emergency_contact_person_name: 'Gourav Pareek', emergency_contact_person_email_id: 'gppareek2@gmail.com', emergency_contact_person_number: '8767899809', bed_type_id: 3, bed_number: 106, patient_id: 666_666, address: 'Kolkata', age: 23)
image_paths = ['voter_id_1.jpeg', 'voter_id_2.jpg']
image_paths.each do |image_path|
  path = Rails.root.join('app', 'assets', 'images', image_path)
  patient6.voter_id.attach(io: File.open(path), filename: image_path)
end
patient6.save
patient7 = Patient.new(name: 'Shatrujeet Bera', email: 'Shatrujeet@gmail.com', sex: 'Male',
                          date_of_birth: Date.new(1995, 10, 15),phone_no:8765432312, emergency_contact_person_name: 'Gourav Pareek', emergency_contact_person_email_id: 'gpparek22@gmail.com', emergency_contact_person_number: '8767899809', bed_type_id: 1, bed_number: 107, patient_id: 782_357, address: 'Jaipur', age: 21)
image_paths = ['voter_id_1.jpeg', 'voter_id_2.jpg']
image_paths.each do |image_path|
  path = Rails.root.join('app', 'assets', 'images', image_path)
  patient7.voter_id.attach(io: File.open(path), filename: image_path)
end
patient7.save
patient8 = Patient.new(name: 'Ankit Kumar', email: 'Ankit@gmail.com', sex: 'Male', date_of_birth: Date.new(1995, 10, 15),phone_no:8765432312,
                          emergency_contact_person_name: 'Gourav Pareek', emergency_contact_person_email_id: 'gareek22@gmail.com', emergency_contact_person_number: '8767899809', bed_type_id:1, bed_number: 108, patient_id: 667_787, address: 'Jamshedpure', age: 21)
image_paths = ['voter_id_1.jpeg', 'voter_id_2.jpg']
image_paths.each do |image_path|
  path = Rails.root.join('app', 'assets', 'images', image_path)
  patient8.voter_id.attach(io: File.open(path), filename: image_path)
end
patient8.save
patient9 = Patient.new(name: 'Mahfuz Alam', email: 'mahfuzflamedestiny@gmail.com', sex: 'Male',
                          date_of_birth: Date.new(2000, 10, 15),phone_no:8765432312, emergency_contact_person_name: 'Gourav Pareek', emergency_contact_person_email_id: 'gpeek22@gmail.com', emergency_contact_person_number: '8767899809', bed_type_id: 1, bed_number: 109, patient_id: 224_353, address: 'Dhanbad', age: 22)
image_paths = ['voter_id_1.jpeg', 'voter_id_2.jpg']
image_paths.each do |image_path|
  path = Rails.root.join('app', 'assets', 'images', image_path)
  patient9.voter_id.attach(io: File.open(path), filename: image_path)
end
patient9.save
patient10 = Patient.new(name: 'Aftab Alam', email: 'Aftab@gmail.com', sex: 'Male', date_of_birth: Date.new(2000, 10, 15),
                           emergency_contact_person_name: 'Gourav Pareek', phone_no:8765432312,emergency_contact_person_email_id: 'gpparee@gmail.com', emergency_contact_person_number: '8767899809', bed_type_id: 2, bed_number: 110, patient_id: 127_645, address: 'Dhanbad', age: 22)
image_paths = ['voter_id_1.jpeg', 'voter_id_2.jpg']
image_paths.each do |image_path|
  path = Rails.root.join('app', 'assets', 'images', image_path)
  patient10.voter_id.attach(io: File.open(path), filename: image_path)
end
patient10.save

payment_type1 = PaymentType.create(name: 'UPI(Unified Payment Interface)')
payment_type2 = PaymentType.create(name: 'Net Banking')
payment_type3 = PaymentType.create(name: 'E-Wallet')

patient1.invoices.build(amount: 120000, payment_type_id: 1)
patient2.invoices.build(amount: 160000, payment_type_id: 2)
patient3.invoices.build(amount: 200000, payment_type_id: 3)
patient4.invoices.build(amount: 120000, payment_type_id: 1)
patient5.invoices.build(amount: 190000, payment_type_id: 2)
patient6.invoices.build(amount: 100000, payment_type_id: 3)
patient7.invoices.build(amount: 670000, payment_type_id: 1)
patient8.invoices.build(amount: 670000, payment_type_id: 2)
patient9.invoices.build(amount: 900000, payment_type_id: 3)
patient10.invoices.build(amount:234000, payment_type_id: 1)
[patient1, patient2, patient3, patient4, patient5, patient6, patient7, patient8, patient9, patient10].each(&:save)

Prescription.create(description: 'Paracetomol 650mg', patient_id: 1)
Prescription.create(description: 'calcium citrate 500mg', patient_id: 2)
Prescription.create(description: 'Drink more water', patient_id: 3)
Prescription.create(description: 'Glucose daily', patient_id: 4)
Prescription.create(description: 'Sleep more', patient_id: 5)
Prescription.create(description: 'Paracetamol 500mg', patient_id: 6)
Prescription.create(description: 'Paracetamol 500mg', patient_id: 7)
Prescription.create(description: 'Vitamin A', patient_id: 8)
Prescription.create(description: 'Vitamin A', patient_id: 9)
Prescription.create(description: 'Vitamin A', patient_id: 10)
