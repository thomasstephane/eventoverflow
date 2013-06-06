class UsersController < ApplicationController
  protect_from_forgery

  include UsersHelper

  def create
    @user = User.new params[:user]
    if @user.save
      redirect_to user_path(@user)
    else
      flash[:errors] = @user.errors.full_messages
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

  #-------------------------------

end
