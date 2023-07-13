# frozen_string_literal: true

# this is a controller
class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy unlock_users]
  before_action :require_user, except: %i[unlock_account confirm]
  before_action :admin?, except: %i[confirm unlock_account]

  def unlock_account
    user = User.find_by(unlock_token: params[:unlock_token])
    if user
      user.unlock_token = nil
      user.is_locked = false
      user.failed_login_attempts = 0
      user.save
      flash[:alert] = 'Your account has been unlocked. You can now log in.'
      redirect_to login_path
    else
      flash[:alert] = 'Invalid unlock token.'
      redirect_to root_path
    end
  end

  def index
    @users = User.all
  end

  def show; end

  def new
    @user = User.new
    return if admin?

    flash[:alert] = 'Not an Admin.'
    redirect_to users_path
  end

  def edit
    return if admin?

    flash[:alert] = 'Not an Admin.'
    redirect_to user_path(@user)
  end

  def create
    @user = User.new(user_params)

    if @user.save
      StaffMailer.staff_added_email(@user).deliver_now
      StaffMailer.account_confirmation_email(@user).deliver_now
      session[:user_id] = @user.id
      flash[:notice] = "User  #{@user.username} has been succesfully created"
      redirect_to @user
    else

      render :new
    end
  end

  def update
    if @patient.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    if admin?
      @user.destroy
      session[:user_id] = nil if @user == current_user
      flash[:notice] = 'Account and all associated articles successfully deleted'
      redirect_to users_path
    else
      flash[:alert] = 'Not an Admin.'
      redirect_to users_path
    end
  end

  def confirm
    @user = User.find_by(confirmation_token: params[:token])
    if @user
      @user.confirm!
      redirect_to confirm_user_path
    else
      # Handle invalid confirmation token
    end
  end

  def locked
    @users = User.all
  end

  def unlock
    user = User.find(params[:id])
    user.unlock_token = nil
    user.is_locked = false
    user.failed_login_attempts = 0
    user.save
    flash[:alert] = "#{user.username} account has been unlocked."
    redirect_to locked_users_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :role_id)
  end
end
