# frozen_string_literal: true

# this is a controller
class BedTypesController < ApplicationController
  before_action :require_user
  before_action :restrict_user
  before_action :admin?
  before_action :set_bed_type, only: %i[show edit update destroy]
  # before_action :show_errors, only: %i[new create edit update]

  def index
    @bed_types = BedType.all.order('created_at DESC')
  end

  def show; end

  def new
    @bed_type = BedType.new
    return if admin?

    redirect_to bed_types_path, flash: { alert: 'Not an Admin.' }
  end

  def create
    @bed_type = BedType.create(bed_type_params)
    if @bed_type.save
      redirect_to @bed_type
    else
      render :new
    end
  end

  def edit
    return if admin?

  
    redirect_to bed_type_path(@bed_type), flash: { alert: 'Not an Admin.' }
  end

  def update
    if @bed_type.update(bed_type_params)
      redirect_to @bed_type
    else
      render :edit
    end
  end

  def destroy
    if admin?
      @bed_type.destroy
      redirect_to bed_types_path
      flash[:alert] = "Bed type #{@bed_type.name} has been deleted"
    else
      redirect_to bed_type_path(@bed_type), flash: { alert: 'Not an Admin.' }
     
    end
  end

  private

  def bed_type_params
    params.require(:bed_type).permit(:name)
  end

  def set_bed_type
    @bed_type = BedType.find(params[:id])
  end
end
