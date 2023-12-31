# frozen_string_literal: true

# this is a controller
class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy unlock_users restrict_action]
  before_action :require_user, except: %i[unlock_account confirm]
  before_action :admin?, except: %i[confirm unlock_account]
  before_action :restrict_action

  def unlock_account
    user = User.find_by(unlock_token: params[:unlock_token])
    if user
      user.unlock_token = nil
      user.is_locked = false
      user.failed_login_attempts = 0
      user.save
      redirect_to login_path, flash: { alert: 'Your account has been unlocked. You can now log in.' }
    else
      redirect_to root_path, flash: { alert: 'Invalid unlock token.' }
    end
  end

  def index
    @users = User.all
  end

  def show; end

  def new
    @user = User.new
    return if admin?

    redirect_to users_path, flash: { alert: 'Not an Admin.' }
  end

  def edit; end

  def create
    @user = User.new(user_params)

    if @user.save
      StaffMailer.staff_added_email(@user).deliver_now
      StaffMailer.account_confirmation_email(@user).deliver_now

      flash[:notice] = "User  #{@user.username} has been succesfully created"
      redirect_to @user
    else

      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user, flash: { success: 'Account has been updated' }
    else
      render :edit
    end
  end

  def destroy
    if admin?
      @user.destroy
      session[:user_id] = nil if @user == current_user
      flash[:alert] = 'Account and all associated data successfully deleted'
    else
      flash[:alert] = 'Not an Admin.'
    end
    redirect_to users_path
  end

  def confirm
    @user = User.find_by(confirmation_token: params[:token])
    if @user.nil?
      redirect_to login_path, alert: 'Your account has already been confirmed. Please log in.'
    else
      @user.confirm!
      redirect_to confirm_account_users_path
    end
  end

  def confirm_account; end

  def locked
    @users = User.all
  end

  def unlock
    user = User.find(params[:id])
    user.unlock_token = nil
    user.is_locked = false
    user.failed_login_attempts = 0
    user.save
    flash[:success] = "#{user.username} account has been unlocked."
    redirect_to locked_users_path
  end

  def restrict_action
    return if @user == current_user

    redirect_to root_path unless admin?
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    permitted_params = [:username, :email, :role_id]

    if admin? && controller_name == 'users' && action_name == 'update'
      return params.require(:user).permit(*permitted_params)
    else
      return params.require(:user).permit(*permitted_params, :password)
    end
  end
end
