# frozen_string_literal: true

# this is a controller
# rubocop:disable Style/Documentation


class PatientsController < ApplicationController
  before_action :require_user
  before_action :set_patient, only: %i[show edit update destroy patient_invoice]

  def index
    @patients = Patient.all.order('created_at DESC')
    @patients = @patients.page(params[:page]).per(5)
  end

  def show; end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.create(patient_params)

    if @patient.save

      redirect_to @patient
    else
      render :new
    end
  end

  def edit; end

  def update
    if @patient.update(patient_params)
      redirect_to @patient
    else
      render :edit
    end
  end

  def destroy
    @patient.destroy

    redirect_to root_path
  end

  def patient_invoice; end

  def search
    query = params[:search_patients].presence && params[:search_patients][:query]
    sort_by = params[:search_patients].presence && params[:search_patients][:sort_by]
    if query.blank?
      @patients = Patient.all.page(params[:page]).per(5)
    else
      @patients = Patient.search_patients(query, sort_by).records
      @patients = @patients.page(params[:page]).per(5)
    end
    session[:patient] = query.strip
    session[:sort] = sort_by
  end

  def filter
    query = session[:patient]
    pat = Patient.search_patients(query,session[:sort]).records
    @patients = apply_filtering(pat, params)
    @patients = @patients.page(params[:page]).per(5)
    render :search
  end



  private

  def patient_params
    params.require(:patient).permit(:name, :phone_no, :email, :sex, :date_of_birth, :emergency_contact_person_name,
                                    :emergency_contact_person_number, :emergency_contact_person_email_id, :bed_number,
                                    :voter_id, :emergency_admission, :voter_id, :address, :bed_type_id, :age)
  end

  def set_patient
    @patient = Patient.find(params[:id])
  end
end
# rubocop:enable Style/Documentation

