# frozen_string_literal: true

# this is a controller
class RolesController < ApplicationController
  before_action :require_user
  before_action :set_role, only: %i[show edit update destroy]

  def index
    @roles = Role.all.order('created_at DESC')
  end

  def show; end

  def new
    @role = Role.new
  end

  def create
    @role = Role.create(role_params)

    if @role.save

      redirect_to @role
    else
      render :new
    end
  end

  def edit; end

  def update
    if @role.update(role_params)
      redirect_to @role
    else
      render :edit
    end
  end

  def destroy
    @role.destroy

    redirect_to roles_path
  end

  private

  def role_params
    params.require(:role).permit(:name)
  end

  def set_role
    @role = Role.find(params[:id])
  end
end
