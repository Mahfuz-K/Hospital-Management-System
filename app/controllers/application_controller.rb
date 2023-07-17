# frozen_string_literal: true

# this is a controller
# rubocop:disable Lint/UselessAssignment
class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?, :admin?
  protect_from_forgery with: :exception

  def current_user
    current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    return if logged_in?

    flash[:alert] = 'You must be logged in to perform that action'
    redirect_to root_path
  end

  def admin?
    current_user.role.name == 'Admin'
  end
end
# rubocop:enable Lint/UselessAssignment
