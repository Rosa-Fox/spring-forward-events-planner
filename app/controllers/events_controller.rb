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
   event = Event.find params[:id]
    if event.update_attributes(event_params)
      redirect_to events_path, :notice => 'Your event information has successfully been updated.'
    else
      redirect_to edit_event_path, :alert => 'There was an error updating your event information - please ensure that all fields have been completed.'
    end
  end

  def edit
    @event = Event.find params[:id]
  end

  def destroy
    Event.destroy params[:id]
    redirect_to events_path, :notice => "Event has been deleted."
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
