# frozen_string_literal: true

# this is a controller
class PrescriptionsController < ApplicationController
  before_action :set_patient
  before_action :require_user
  before_action :admin?
  before_action :set_prescription, only: %i[show edit update destroy]

  def index
    @prescriptions = @patient.prescriptions.all.order('created_at DESC')
  end

  def show; end

  def new
    @prescription = Prescription.new
    return if admin?

    redirect_to patient_prescriptions_path, flash: { alert: 'Not an Admin.' }
  end

  def create
    @prescription = Prescription.create(prescription_params)
    @prescription.patient_id = @patient.id

    if @prescription.save

      redirect_to patient_prescription_path(@patient, @prescription)
    else
      render :new
    end
  end

  def edit
    return if admin?

    redirect_to patient_prescription_path(@patient, @prescription),flash: { alert: 'Not an Admin.' }
  end

  def update
    if @prescription.update(prescription_params)
      redirect_to patient_prescription_path(@patient, @prescription)
    else
      render :edit
    end
  end

  def destroy
    if admin?
      @prescription.destroy
      redirect_to patient_prescriptions_path, flash: { alert: 'Prescription has been deleted.' }
    else
      redirect_to patient_prescription_path(@patient, @prescription), flash: { alert: 'Not an Admin.' }
    end
  end

  private

  def prescription_params
    params.require(:prescription).permit(:description)
  end

  def set_patient
    @patient = Patient.find(params[:patient_id])
  end

  def set_prescription
    @prescription = Prescription.find(params[:id])
  end
end
