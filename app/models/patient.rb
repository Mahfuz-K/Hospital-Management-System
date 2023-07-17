# frozen_string_literal: true

# this is a model
# rubocop:disable all

class Patient < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  def self.index_data
    __elasticsearch__.create_index! force: true
    __elasticsearch__.import
  end
  
  has_many_attached :voter_id
  belongs_to :bed_type
  has_many :invoices, dependent: :destroy
  has_many :prescriptions, dependent: :destroy
  validates :name, presence: true
  validates :phone_no,length: { minimum: 8, maximum: 10, message: 'Invalid phone number' },
  presence: { message: "Phone number can't be empty" }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    length: { maximum: 105 },
                    format: { with: VALID_EMAIL_REGEX }

  validates :sex, presence: true, inclusion: { in: %w[Male Female Other] }
  validates :address, presence: true
  validates :age, presence: true
  validates :date_of_birth, presence: true
  validates :emergency_contact_person_name, presence: true
  validates :emergency_contact_person_number, presence: true,
                                              format: { with: /\A\d+\z/, message: 'only allows digits' }
  validates :emergency_contact_person_email_id, presence: true, format: { with: VALID_EMAIL_REGEX }

  before_create :generate_patient_id

  def generate_patient_id
    self.patient_id = loop do
      random_id = rand(100_000..999_999)
      break random_id unless Patient.exists?(patient_id: random_id)
    end
  end

  settings do
    mappings dynamic: true do
      indexes :name, type: :text, fielddata: :true
      indexes :email, type: :text, fielddata: :true
      indexes :patient_id, type: :text, fielddata: :true
      indexes :phone_no, type: :text, fielddata: :true
      indexes :date_of_birth, type: :text, fielddata: :true
      indexes :sex, type: :text, fielddata: :true
      indexes :address, type: :text, fielddata: :true
      indexes :emergency_admission, type: :text, fielddata: :true


    end
  end
  def as_indexed_json(_options = {})
    {
      id: id,
      name: name,
      email: email,
      patient_id: patient_id,
      date_of_birth: date_of_birth,
      phone_no: phone_no,
      sex: sex,
      address: address,
      emergency_admission: emergency_admission

    }
  end

  def self.search_patients(query, filter_column, filter_value, sort_by)
    search_params = {
      query: {
        bool: {
          must: [
            {
              multi_match: {
                query: "*#{query}*",
                fields: %i[name email patient_id phone_no date_of_birth sex address emergency_admission]
              }
            }
          ],
          filter: []
        }
      }
    }
  
    if !filter_column.empty? && !filter_value.empty?
      search_params[:query][:bool][:filter] << {
        term: {
          filter_column.to_sym => filter_value
        }
      }
    end
  
    if sort_by && !sort_by.empty?
      search_params[:sort] = {
        sort_by.to_sym => {
          order: :asc
        }
      }
    end
  
    search(search_params)
  end
  index_data
end  
# rubocop:enable all
