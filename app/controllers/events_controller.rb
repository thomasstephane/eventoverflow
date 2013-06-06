class EventsController < ApplicationController

  include FormHelper
  include UsersHelper
  include VotesHelper

  def show
    @event = Event.find(params[:id])
    @comment = Comment.new
  end

  def new
    @event = Event.new
    render :new
  end

  def create
    if current_user
      if invalid_form(params[:event], "event") != []
        @errors = invalid_form(params[:event], "event")
        new
      else
        @event = Event.new(params[:event])
        @event.save
        current_user.created_events << @event
        current_user.save
        @events = Event.all
        redirect_to root_path
      end
    else
      redirect_to root_path
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
  
  def vote
    vote = find_voteable
    if vote.save
      render :json => {}
    else
      render :json => {}
    end
  end
end
