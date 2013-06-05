class UsersController < ApplicationController
  def create
    @user = User.new params[:user]
    if @user.save
      redirect_to user_path(@user)
    else
      render new_user_path(@user)
    end
  end

  def new
    @user = User.new
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

  def login
    @user = User.new
  end
end
