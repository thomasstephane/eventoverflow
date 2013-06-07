class SessionsController < ApplicationController
  def new
    render '/users/login'
  end

  def create
    @user = User.find_by_username(params[:username])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:errors_login] = ['Invalid username or password.']

      redirect_to root_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
