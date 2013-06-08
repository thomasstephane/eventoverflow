class EventConfirmationsController < ApplicationController

  def update
    @event = Event.find(params[:event_id])
    @existing_decision = EventConfirmation.find_by_user_id_and_event_id(current_user.id, @event.id)
    @event_confirmation = @existing_decision ? @existing_decision : EventConfirmation.new(:user_id => current_user.id, :event_id => @event.id)
    @event_confirmation.decision = params[:event_confirmation][:decision]
    @event_confirmation.save
    redirect_to event_path(@event)
  end

end
