class EventsController < ApplicationController

  def show
    @event = Event.find(params[:id])
    @comment = Comment.new
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
    redirect_to events_path    
  end

end
