class CommentsController < ApplicationController

  include FormHelper

  def create
    comment = params[:comment]
    @event = Event.find(comment[:event_id])
    @existing_decision = EventConfirmation.find_by_user_id_and_event_id(current_user.id, @event.id)
    @event_confirmation = @existing_decision ? @existing_decision : EventConfirmation.new
    if invalid_form(comment, "comment") != []
      @errors = invalid_form(comment, "comment")
      @comments = Comment.all
      @comment = Comment.new
      redirect_to event_path(@event)
    else
      Comment.create( comment: comment[:comment],
                      user_id: session[:user_id],
                      event_id: comment[:event_id],
                      commentable_type: comment[:commentable_type],
                      commentable_id: comment[:commentable_id])

      @comments = Comment.all
      redirect_to event_path(@event)
    end
  end

  def show
    @comment = Comment.find(params[:id])
    @event = Event.find(@comment.event_id)
    redirect_to @event
  end
end
