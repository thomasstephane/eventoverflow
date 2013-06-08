class EventConfirmationsController < ApplicationController

  def update
    @event = Event.find(params[:event_id])
    @event.attend(params[:decision])
    redirect_to event_path(@event)
  end

end
