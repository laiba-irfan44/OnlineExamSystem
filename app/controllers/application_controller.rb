# frozen_string_literal: true

# Application Controller
class ApplicationController < ActionController::Base
  include Pundit::Authorization

  protect_from_forgery with: :exception
  protect_from_forgery with: :null_session
  # before_action :configure_permitted_parameters, if: :devise_controller?
  def after_sign_in_path_for(resource)
    if resource.admin?
      admin_index_path_url
    elsif resource.teacher?
      teacher_index_path_path
    else
      student_index_path_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: %i[email password password_confirmation full_name role teacher_id])
    devise_parameter_sanitizer.permit(:account_update,
                                      keys: %i[email password password_confirmation current_password full_name])
  end
end
