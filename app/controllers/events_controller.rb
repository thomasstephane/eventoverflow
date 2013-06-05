class EventsController < ApplicationController
  protect_from_forgery

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
    @event = Event.new(params[:event])
    @event.save
    @events = Event.all
    render :index
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
