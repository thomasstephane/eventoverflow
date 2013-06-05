class UsersController < ApplicationController
  def create
    @user = User.new params[:user]
    if @user.save
      p 'yeah'
    end

    redirect_to user_path(@user)
  end

  def new
    @user = User.new
  end

  def edit

  end

  def show

  end

  def update

  end

  def destroy

  end
end
