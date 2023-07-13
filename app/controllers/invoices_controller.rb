# frozen_string_literal: true

# this is a controller
class InvoicesController < ApplicationController
  before_action :set_patient, except: [:generate_invoice]
  before_action :require_user
  before_action :set_invoice, only: %i[show edit update destroy]

  include InvoicesHelper
  def index
    @invoices = @patient.invoices.all.order('created_at DESC')
  end

  def show; end

  def new
    @invoice = Invoice.new
  end

  def create
    @invoice = Invoice.create(invoice_params)
    @invoice.patient_id = @patient.id

    if @invoice.save

      redirect_to patient_invoice_path(@patient, @invoice)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @invoice.update(invoice_params)
      redirect_to patient_invoice_path(@patient, @invoice)
    else
      render :edit
    end
  end

  def destroy
    @invoice.destroy

    redirect_to patient_invoices_path
  end

  def generate_invoice
    @invoice = Invoice.find(params[:id])
    pdf = invoice_pdf(@invoice)
    send_data(pdf.render, filename: 'invoice.pdf', type: 'application/pdf', disposition: 'inline')
  end

  def email_invoice
    @invoice = Invoice.find(params[:id])
    pdf = invoice_pdf(@invoice)
    InvoiceMailer.with(patient: @invoice.patient, invoice: pdf).invoice_email.deliver_now

    flash[:success] = "Invoive mail sent to #{@patient.name}"
    redirect_to patient_invoices_path(@patient)
  end

  private

  def invoice_params
    params.require(:invoice).permit(:amount, :payment_type_id)
  end

  def set_patient
    @patient = Patient.find(params[:patient_id])
  end

  def set_invoice
    @invoice = Invoice.find(params[:id])
  end
end
