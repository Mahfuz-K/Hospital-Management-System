#rubocop:disable all
module PatientHelper
    def sort_patient(sort_param, obj)
        case sort_param
        when 'id_asc'
          obj.order(patient_id: :asc)
        when 'id_desc'
          obj.order(patient_id: :desc)
        when 'name_asc'
          obj.order(name: :asc)
        when 'name_desc'
          obj.order(name: :desc)
        when 'date_asc'
          obj.order(date_of_birth: :asc)
        when 'date_desc'
          obj.order(date_of_birth: :desc)
        else
            obj.order(name: :asc)
        end
    end
    
end