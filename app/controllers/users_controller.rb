class UsersController < ApplicationController

  before_action :set_user

  def edit
  end

  def update
    if @user.update(user_params)
      #TODO events path
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name)
  end

end
