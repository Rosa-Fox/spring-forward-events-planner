class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
  	@event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to events_path, notice: 'New event has been successfully added!'
    else
      flash.now.alert = 'Form incomplete - please ensure that you have filled out all fields.'
      render 'new'
    end
  end

  def update
  end

  private

  def event_params
    params.require(:event).permit(
        :name,
        :venue,
        :date,
        :time
        )
  end
end
