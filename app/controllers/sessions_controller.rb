class SessionsController < Devise::SessionsController
  def create
    super
  end

 
  protected

  def after_sign_in_path_for(resource)
    home_path
  end

end
