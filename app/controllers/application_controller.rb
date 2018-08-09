class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    added_attrs = [
      :username,
      :email,
      :password,
      :password_confirmation,
      :profile_photo,
      :remember_me,
      :first_name,
      :last_name,
      :nickname,
      :belt,
      :stripes,
      :instructor,
      :profile_photo
    ]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
