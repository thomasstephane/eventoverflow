class CommentsController < ApplicationController
  protect_from_forgery

  include FormHelper

  def show
  end

  def create
    @comment = params[:comment]
    @event = Event.find(params[:event_id])
    if invalid_form(@comment, "comment") != []
      @errors = invalid_form(@comment, "comment")
      @comment = Comment.new
      render 'events/show'
    else
      @comment = Comment.new(comment: @comment[:comment], event_id: params[:event_id], user_id: session[:id])
      @comment.save
      @comments = Comment.all
      redirect_to event_path(@event)
    end
  end
end