# frozen_string_literal: true

# this is a controller
class PasswordsController < ApplicationController
  def forgot_password; end

  def send_reset_password_instructions
    user = User.find_by(email: params[:email])
    if user
      user.generate_reset_password_token
      StaffMailer.password_reset_email(user).deliver_later
    end
    flash[:notice] = 'Please check your mail for further instructions'
    redirect_to login_path
  end

  def reset_password
    @user = User.find_by(reset_password_token: params[:token])
  end

  def update_password
    @user = User.find_by(reset_password_token: params[:token])
    return unless @user
    return unless @user.update(password: params[:password], password_confirmation: params[:password_confirmation])

    if @user.first_login
      @user.first_login = false
      @user.save
      flash[:notice] = 'Your password has been successfully updated .'
      redirect_to patients_path
    else
      flash[:notice] = 'Your password has been successfully updated . Please Login'
      redirect_to login_path
    end
  end
end
