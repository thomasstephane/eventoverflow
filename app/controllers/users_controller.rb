class UsersController < ApplicationController
  protect_from_forgery

  include UsersHelper

  def create
    @user = User.new params[:user]
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:errors_signup] = @user.errors.full_messages
      redirect_to root_path
    end
  end

  def edit

  end

  def show
    @user = User.find params[:id]
  end

  def update

  end

  def destroy

  end

end
