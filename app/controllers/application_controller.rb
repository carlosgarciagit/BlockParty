class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def home
  end

  def check_privileges!
    redirect_to "/", notice: 'You dont have enough permissions to be here' unless current_user.admin
  end

  def search
    EventRegistration.each do |event|
    end
  end

end
