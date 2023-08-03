# frozen_string_literal: true

# this is a controller
# rubocop:disable Metrics/AbcSize
# rubocop:disable Metrics/MethodLength
class SessionsController < ApplicationController
  before_action :logged_in?, except: [:destroy]

  def new
    return unless logged_in?

    redirect_to patients_path
  end

  def create
    user = User.find_by(email: params[:email].downcase)
    if user&.authenticate(params[:password]) && user&.confirmed && !user&.is_locked
      user.update(failed_login_attempts: 0)
      session[:user_id] = user.id
      if current_user.first_login
        user.generate_reset_password_token
        user.save
        redirect_to reset_password_path(token: user.reset_password_token)
      else
        redirect_to patients_path, flash: { notice: 'Logged in your account successfully' }
      end
    else
      failed_login(user)
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:alert] = 'Logged out'
    redirect_to root_path
  end

  def failed_login(user)
    if user
      user.increment!(:failed_login_attempts)
      if user.failed_login_attempts >= 3
        user.update(is_locked: true)
        user.generate_unlock_token
        user.unlock_token = user.generate_unlock_token
        user.save
        StaffMailer.unlock_account_email(user).deliver_now
        redirect_to '/login', flash: { alert: 'Your account has been locked. Please check your email for instructions to unlock.' }
      end
    else

      redirect_to '/login', flash: { alert: 'There was something wrong with your login details.' }

    end
  end
end
# rubocop:enable Metrics/AbcSize
# rubocop:enable Metrics/MethodLength
