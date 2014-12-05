class PasswordsController < Devise::PasswordsController
  def create
    super
  end

  protected

  def after_resetting_password_path_for(resource)
    home_path
  end

  # The path used after sending reset password instructions
  def after_sending_reset_password_instructions_path_for(resource_name)
    home_path
  end

end
