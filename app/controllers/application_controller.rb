# frozen_string_literal: true

# this is a controller
# rubocop:disable Lint/UselessAssignment
class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?, :admin?
  protect_from_forgery with: :exception
  rescue_from ActiveRecord::RecordNotFound, with: :not_found_method
  before_action :set_nil

  def not_found_method
    render file: Rails.public_path.join('404.html'), status: :not_found, layout: false
  end

  def current_user
    current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    return if logged_in?

    redirect_to root_path, flash: { alert: 'You must be logged in to perform that action' }
  end

  def admin?
    current_user.role.name == 'Admin'
  end

  def restrict_user
    redirect_to root_path unless admin?
  end

  def apply_filtering(pat, params)
    filtered_patients = pat
    filtered_patients = filtered_patients.where(sex: params[:sex]) if params[:sex].present?
    filtered_patients = filtered_patients.where(emergency_admission: params[:emergency_admission]) if params[:emergency_admission].present?
    filtered_patients = filtered_patients.where(bed_type_id: params[:bed_type_id]) if params[:bed_type_id].present?
    filtered_patients
  end

  def set_nil
    session[:patient] = nil
  end
end
# rubocop:enable Lint/UselessAssignment