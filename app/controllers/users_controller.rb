class UsersController < ApplicationController

  before_action :set_user

  def edit
    now = Time.zone.now
    @upcoming_events = []
    @previous_events = []
    registered_events = EventRegistration.where(user: current_user).collect{ |event_registration| event_registration.event}

    registered_events.compact!

    if registered_events.count > 0
      registered_events.each do |event|
        if event.start_time > now
          @upcoming_events.push(event)
        else
          @previous_events.push(event)
        end
      end
    end

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
    params.require(:user).permit(:first_name, :last_name, :name, :avatar, interest_ids: [])
  end

end
