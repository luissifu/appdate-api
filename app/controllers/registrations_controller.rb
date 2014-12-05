class RegistrationsController < Devise::RegistrationsController
  before_filter :configure_sign_up_params, only: [:create]

  def create
    super
  end

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.for(:sign_up)
  end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    home_path
  end

end
