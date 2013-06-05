class EventsController < ActionController::Base
  protect_from_forgery

  def index
    @events = Event.all
  end

  def create
    @event = Event.new(params[:event])
    @event.save
  end

  def new
    @event = Event.new
  end

  def edit
    @event = Event.find(params[:id])
  end

  def show
  end

  def update
  end

  def destroy
  end

end
