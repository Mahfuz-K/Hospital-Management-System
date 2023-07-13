# frozen_string_literal: true

# this is a controller
class PaymentTypesController < ApplicationController
  before_action :require_user
  before_action :admin?
  before_action :set_payment_type, only: %i[show edit update destroy]

  def index
    @payment_types = PaymentType.all.order('created_at DESC')
  end

  def show; end

  def new
    @payment_type = PaymentType.new
    return if admin?

    flash[:alert] = 'Not an Admin.'
    redirect_to payment_types_path
  end

  def create
    @payment_type = PaymentType.create(payment_type_params)

    if @payment_type.save

      redirect_to @payment_type
    else
      render :new
    end
  end

  def edit
    return if admin?

    flash[:alert] = 'Not an Admin.'
    redirect_to payment_type_path(@payment_type)
  end

  def update
    if @payment_type.update(payment_type_params)
      redirect_to @payment_type
    else
      render :edit
    end
  end

  def destroy
    if admin?
      @payment_type.destroy
      flash[:alert] = "Payment Type #{@payment_type.name} deleted successfully"
      redirect_to payment_types_path
    else
      flash[:alert] = 'Not an Admin.'

    end
  end

  private

  def payment_type_params
    params.require(:payment_type).permit(:name)
  end

  def set_payment_type
    @payment_type = PaymentType.find(params[:id])
  end
end
