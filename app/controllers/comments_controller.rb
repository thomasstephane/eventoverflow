class CommentsController < ApplicationController

  include FormHelper

  def create
    comment = params[:comment]
    @event = Event.find(comment[:event_id])
    if invalid_form(comment, "comment") != []
      @errors = invalid_form(comment, "comment")
      @comment = Comment.new
      render 'events/show'
    else
      com = Comment.create(comment: comment[:comment], user_id: session[:user_id], event_id: comment[:event_id])
      @event.comments << com
      # @comment = Comment.new(comment: comment[:comment], event_id: comment[:event_id], user_id: session[:user_id]
      # @comment.save
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
