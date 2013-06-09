
class CalendarsController < ApplicationController
  protect_from_forgery
  
  def create
    @event = Event.find(params[:event_id])
    @token = current_user.oauth_token
    @client = Event.client_creator
    @client.authorization.access_token = @token
    @calendar = @client.discovered_api('calendar', 'v3')
    add_to_calendar
    
    redirect_to event_path(@event)
  end

  def add_to_calendar
    
    p goog_event = {
      'summary' => @event.title,
      'location' => @event.location,
      'start' => {
        'dateTime' => @event.starts_at
      },
      'end' => {
        'dateTime' => @event.starts_at + @event.duration
      }
    }
    
    p @result = @client.execute(:api_method => @calendar.events.insert,
      :parameters => {'calendarId' => 'primary'},
      :body => JSON.dump(goog_event),
      :headers => {'Content-Type' => 'application/json'})
  end

end