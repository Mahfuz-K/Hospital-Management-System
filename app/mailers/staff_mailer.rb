# frozen_string_literal: true

# this is a helper
# rubocop:disable Lint/UnusedMethodArgument
class StaffMailer < ApplicationMailer
  def staff_added_email(staff)
    mail(to: 'mahfuzflamedestiny@gmail.com', subject: 'Staff Added')
  end

  def account_confirmation_email(user)
    @user = user
    @host = 'localhost:3000'
    mail(to: user.email, subject: 'Confirm your account')
  end

  def password_reset_email(user)
    @user = user
    @reset_password_url = reset_password_url(@user.reset_password_token)
    mail(to: @user.email, subject: 'Password Reset Instructions')
  end

  def unlock_account_email(user)
    @user = user
    mail(to: @user.email, subject: 'Unlock Your Account')
  end
end
# rubocop:enable Lint/UnusedMethodArgument
