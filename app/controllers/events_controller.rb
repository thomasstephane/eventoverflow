class EventsController < ApplicationController

  def show
    @event = Event.find(params[:id])
    @all_comments = @event.all_comments
    @comment = Comment.new
    @existing_decision = EventConfirmation.find_by_user_id_and_event_id(current_user.id, @event.id)
    @event_confirmation = @existing_decision ? @existing_decision : EventConfirmation.new
  end

  def new
    @event = Event.new
    render :new
  end

  def create
    if invalid_form(params[:event], "event") != []
      @errors = invalid_form(params[:event], "event")
      new
    else
      @event = Event.new(params[:event])
      @event.starts_at -= Time.now.utc_offset
      @event.extern_id = @event.id if @event.extern_id = nil
      current_user.events << @event
      @event.save
      @events = Event.all
      redirect_to root_path
    end
  end
  
  def edit
    @event = Event.find(params[:id])    
  end

  def update
    @event = Event.find(params[:id])
    @event.update_attributes(params[:event])
    redirect_to event_path(@event)
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to root_path 
  end

end
