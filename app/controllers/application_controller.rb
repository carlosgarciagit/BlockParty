class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def home
    @user = 'Hello'
  end

end
