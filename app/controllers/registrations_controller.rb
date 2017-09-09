class RegistrationsController < Devise::RegistrationsController

  protected

  def after_sign_up_path_for(resource)
    # edit_users_path(resource)
    root_path
  end

  def sign_up_params
    params.require(:user).permit(:full_name, :email, :password, :password_confirmation)
  end

end
