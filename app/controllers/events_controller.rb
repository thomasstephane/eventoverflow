class EventsController < ApplicationController
  protect_from_forgery

  include EventHelper

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
    render :new
  end

  def create
    if invalid_event(params[:event]) != []
      @errors = invalid_event(params[:event])
      new
    else
      @event = Event.new(params[:event])
      @event.save
      @events = Event.all
      render :index
    end
  end
  
  def edit
    @event = Event.find(params[:id])    
  end

  def update
    @event = Event.find(params[:id])
    @event.update_attributes(params[:event])
    redirect_to events_path
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path    
  end

end
