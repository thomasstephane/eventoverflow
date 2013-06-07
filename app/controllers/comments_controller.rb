class CommentsController < ApplicationController
  protect_from_forgery

  include FormHelper

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

  def new
    @comment = Comment.new
  end

  def edit
    @comment = Comment.find(params[:id])
    @event = Event.find(@comment.event_id)
  end

  def show
    @comment = Comment.find(params[:id])
    @event = Event.find(@comment.event_id)
    redirect_to @event
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update_attributes(params[:comment])
    redirect_to @comment
  end

  def destroy
    Comment.destroy(params[:id])
    @user = User.find(session[:id])
    redirect_to @user
  end
end