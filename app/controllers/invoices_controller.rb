# frozen_string_literal: true

# this is a controller
class InvoicesController < ApplicationController
  before_action :require_user
  before_action :set_invoice, only: %i[show edit update destroy]

  include InvoicesHelper
  def index
    @invoices = Invoice.all.order('created_at DESC')
  end

  def show; end

  def new
    @invoice = Invoice.new
  end

  def create
    @invoice = Invoice.create(invoice_params)
   
    if @invoice.save

      redirect_to invoice_path(@invoice)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @invoice.update(invoice_params)
      redirect_to invoice_path(@invoice)
    else
      render :edit
    end
  end

  def destroy
    @invoice.destroy
    redirect_to invoices_path
    flash[:alert] = 'Invoice has been deleted'
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

    flash[:success] = "Invoive mail sent to #{@invoice.patient.name}"
    redirect_to invoice_path(@invoice)
  end

  private

  def invoice_params
    params.require(:invoice).permit(:amount, :payment_type_id, :patient_id)
  end

  def set_invoice
    @invoice = Invoice.find(params[:id])
  end
end
