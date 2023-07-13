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
User.create(username: 'Jabra Ram', email: 'jrchoudhary2410@gmail.com', password: '1234', admin: true,
            role_id: role2.id, first_login: false)

bed_type1 = BedType.create(name: 'General Ward')
bed_type2 = BedType.create(name: 'ICU')
bed_type3 = BedType.create(name: 'Private Ward')

patient1 = Patient.create(name: 'Mahfuz Alam', email: 'Mahfuzalamdestiny@gmail.com', sex: 'Male',
                          date_of_birth: Date.new(1990, 10, 15), emergency_contact_person_name: 'Gourav Pareek', emergency_contact_person_email_id: 'gppareek22@gmail.com', emergency_contact_person_number: '8767899809', bed_type_id: bed_type1.id, bed_number: 101, patient_id: 111_111, address: 'Kolkata', age: 33)
image_paths = ['voter_id_1.jpg', 'voter_id_2.jpeg']
image_paths.each do |image_path|
  path = Rails.root.join('app', 'assets', 'images', image_path)
  patient1.voter_id.attach(io: File.open(path), filename: image_path)
end
patient2 = Patient.create(name: 'Lokesh Chaman', email: 'lokeshkumarchaman@gmail.com', sex: 'Male',
                          date_of_birth: Date.new(1991, 10, 15), emergency_contact_person_name: 'Gourav Pareek', emergency_contact_person_email_id: 'gppareek22@gmail.com', emergency_contact_person_number: '8767899809', bed_type_id: bed_type1.id, bed_number: 102, patient_id: 2_222_222, address: 'Kolkata', age: 33)
image_paths = ['voter_id_1.jpg', 'voter_id_2.jpeg']
image_paths.each do |image_path|
  path = Rails.root.join('app', 'assets', 'images', image_path)
  patient2.voter_id.attach(io: File.open(path), filename: image_path)
end
patient3 = Patient.create(name: 'Lokesh Kumar', email: 'lokesh.chaman@kreeti.com', sex: 'Male',
                          date_of_birth: Date.new(1990, 10, 15), emergency_contact_person_name: 'Gourav Pareek', emergency_contact_person_email_id: 'gppareek22@gmail.com', emergency_contact_person_number: '8767899809', bed_type_id: bed_type2.id, bed_number: 103, patient_id: 333_333, address: 'Jaipur', age: 25)
image_paths = ['voter_id_1.jpg', 'voter_id_2.jpeg']
image_paths.each do |image_path|
  path = Rails.root.join('app', 'assets', 'images', image_path)
  patient3.voter_id.attach(io: File.open(path), filename: image_path)
end
patient4 = Patient.create(name: 'Jabra Ram', email: 'jrchoudhary2410@gmail.com', sex: 'Male',
                          date_of_birth: Date.new(1991, 10, 15), emergency_contact_person_name: 'Gourav Pareek', emergency_contact_person_email_id: 'gppareek22@gmail.com', emergency_contact_person_number: '8767899809', bed_type_id: bed_type2.id, bed_number: 104, patient_id: 444_444, address: 'Jaipur', age: 25)
image_paths = ['voter_id_1.jpg', 'voter_id_2.jpeg']
image_paths.each do |image_path|
  path = Rails.root.join('app', 'assets', 'images', image_path)
  patient4.voter_id.attach(io: File.open(path), filename: image_path)
end
patient5 = Patient.create(name: 'Azad Sing', email: 'azad@gmail.com', sex: 'Male', date_of_birth: Date.new(1999, 10, 15),
                          emergency_contact_person_name: 'Gourav Pareek', emergency_contact_person_email_id: 'gppareek22@gmail.com', emergency_contact_person_number: '8767899809', bed_type_id: bed_type3.id, bed_number: 105, patient_id: 555_555, address: 'Kolkata', age: 23)
image_paths = ['voter_id_1.jpg', 'voter_id_2.jpeg']
image_paths.each do |image_path|
  path = Rails.root.join('app', 'assets', 'images', image_path)
  patient5.voter_id.attach(io: File.open(path), filename: image_path)
end
patient6 = Patient.create(name: 'Madiha Mallick', email: 'mallickmadiha9031@gmail.com', sex: 'Female',
                          date_of_birth: Date.new(1999, 10, 15), emergency_contact_person_name: 'Gourav Pareek', emergency_contact_person_email_id: 'gppareek22@gmail.com', emergency_contact_person_number: '8767899809', bed_type_id: bed_type3.id, bed_number: 106, patient_id: 666_666, address: 'Kolkata', age: 23)
image_paths = ['voter_id_1.jpg', 'voter_id_2.jpeg']
image_paths.each do |image_path|
  path = Rails.root.join('app', 'assets', 'images', image_path)
  patient6.voter_id.attach(io: File.open(path), filename: image_path)
end
patient7 = Patient.create(name: 'Shatrujeet Bera', email: 'Shatrujeet@gmail.com', sex: 'Male',
                          date_of_birth: Date.new(1995, 10, 15), emergency_contact_person_name: 'Gourav Pareek', emergency_contact_person_email_id: 'gppareek22@gmail.com', emergency_contact_person_number: '8767899809', bed_type_id: bed_type1.id, bed_number: 107, patient_id: 782_357, address: 'Jaipur', age: 21)
image_paths = ['voter_id_1.jpg', 'voter_id_2.jpeg']
image_paths.each do |image_path|
  path = Rails.root.join('app', 'assets', 'images', image_path)
  patient7.voter_id.attach(io: File.open(path), filename: image_path)
end
patient8 = Patient.create(name: 'Ankit Kumar', email: 'Ankit@gmail.com', sex: 'Male', date_of_birth: Date.new(1995, 10, 15),
                          emergency_contact_person_name: 'Gourav Pareek', emergency_contact_person_email_id: 'gppareek22@gmail.com', emergency_contact_person_number: '8767899809', bed_type_id: bed_type1.id, bed_number: 108, patient_id: 667_787, address: 'Jamshedpure', age: 21)
image_paths = ['voter_id_1.jpg', 'voter_id_2.jpeg']
image_paths.each do |image_path|
  path = Rails.root.join('app', 'assets', 'images', image_path)
  patient8.voter_id.attach(io: File.open(path), filename: image_path)
end
patient9 = Patient.create(name: 'Mahfuz Alam', email: 'mahfuzflamedestiny@gmail.com', sex: 'Male',
                          date_of_birth: Date.new(2000, 10, 15), emergency_contact_person_name: 'Gourav Pareek', emergency_contact_person_email_id: 'gppareek22@gmail.com', emergency_contact_person_number: '8767899809', bed_type_id: bed_type2.id, bed_number: 109, patient_id: 224_353, address: 'Dhanbad', age: 22)
image_paths = ['voter_id_1.jpg', 'voter_id_2.jpeg']
image_paths.each do |image_path|
  path = Rails.root.join('app', 'assets', 'images', image_path)
  patient9.voter_id.attach(io: File.open(path), filename: image_path)
end
patient10 = Patient.create(name: 'Aftab Alam', email: 'Aftab@gmail.com', sex: 'Male', date_of_birth: Date.new(2000, 10, 15),
                           emergency_contact_person_name: 'Gourav Pareek', emergency_contact_person_email_id: 'gppareek22@gmail.com', emergency_contact_person_number: '8767899809', bed_type_id: bed_type2.id, bed_number: 110, patient_id: 127_645, address: 'Dhanbad', age: 22)
image_paths = ['voter_id_1.jpg', 'voter_id_2.jpeg']
image_paths.each do |image_path|
  path = Rails.root.join('app', 'assets', 'images', image_path)
  patient10.voter_id.attach(io: File.open(path), filename: image_path)
end

payment_type1 = PaymentType.create(name: 'UPI(Unified Payment Interface)')
payment_type2 = PaymentType.create(name: 'Net Banking')
payment_type3 = PaymentType.create(name: 'E-Wallet')

Invoice.create(amount: 120_000, patient_id: patient1.id, payment_type_id: payment_type1.id)
Invoice.create(amount: 160_000, patient_id: patient1.id, payment_type_id: payment_type2.id)
Invoice.create(amount: 200_000, patient_id: patient2.id, payment_type_id: payment_type3.id)
Invoice.create(amount: 120_000, patient_id: patient2.id, payment_type_id: payment_type1.id)
Invoice.create(amount: 190_000, patient_id: patient3.id, payment_type_id: payment_type2.id)
Invoice.create(amount: 100_000, patient_id: patient3.id, payment_type_id: payment_type3.id)
Invoice.create(amount: 670_000, patient_id: patient4.id, payment_type_id: payment_type1.id)
Invoice.create(amount: 980_000, patient_id: patient4.id, payment_type_id: payment_type2.id)

Prescription.create(description: 'Paracetomol 650mg', patient_id: patient1.id)
Prescription.create(description: 'calcium citrate 500mg', patient_id: patient1.id)
Prescription.create(description: 'Drink more water', patient_id: patient2.id)
Prescription.create(description: 'Glucose daily', patient_id: patient2.id)
Prescription.create(description: 'Sleep more', patient_id: patient3.id)
Prescription.create(description: 'Paracetamol 500mg', patient_id: patient3.id)
Prescription.create(description: 'Paracetamol 500mg', patient_id: patient4.id)
Prescription.create(description: 'Vitamin A', patient_id: patient4.id)
