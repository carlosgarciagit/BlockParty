class UsersController < ApplicationController

  before_action :set_user

  def edit
  end

  def update
    if @user.update(user_params)
      #TODO events path
      flash[:notice] = 'Updated your profile'
      redirect_to root_path
    else
      # TODO  error messages
      render :edit
    end
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :avatar, interest_ids: [])
  end

end
