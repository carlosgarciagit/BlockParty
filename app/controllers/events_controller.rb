class EventsController < ApplicationController

  def index
    now = Time.zone.now
    @upcoming_events = Event.all.where('end_time >= ?', now)
    @previous_events = Event.all.where('end_time < ?', now)
  end

  def show
    @event = Event.find(params[:id])
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
