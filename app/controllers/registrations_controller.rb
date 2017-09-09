class RegistrationsController < Devise::RegistrationsController

  protected

  def after_sign_up_path_for(resource)
    # edit_users_path(resource)
    root_path
  end
end
