class EventsController < ApplicationController
  before_action :check_privileges!, except: [:show, :index, :register]

  def index
    now = Time.zone.now
    @upcoming_events = Event.all.where('end_time >= ?', now)
    @previous_events = Event.all.where('end_time < ?', now)

    @registered_events = EventRegistration.where(user: current_user).collect{ |event_registration| event_registration.event}

    @user = current_user

  end

  def show
    now = Time.zone.now
    @event = Event.find(params[:id])

    @registered = @event.users.include?(current_user)
    @upcoming = @event.end_time > now

    @user = current_user


  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to event_path(@event)

    else
      #TODO error messages
      flash[:alert] = "Errors!!!!"
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
    @user = current_user
  end

  def update
    @event = Event.find(params[:id])
    if @event.update!(event_params)
      redirect_to event_path(@event)
    else
      #TODO error messages
      flash[:alert] = "Errors!!!!"
      render :edit
    end
  end

  def register
    @event = Event.find(params[:event_id])
    user = current_user
    event_registration = EventRegistration.create(event: @event, user: user)
  end

  private

  def event_params
    params.require(:event)
      .permit(:name,
              :description,
              :start_time,
              :end_time,
              :event_photo)
  end
end
