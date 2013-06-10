class SessionController < ApplicationController
  def create
    @user = User.find_by_username(params[:username])
    if auth
      provider_user = User.from_omniauth(auth)
      session[:user_id] = provider_user.id
      redirect_to root_path
    elsif @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:errors_login] = ['Invalid username or password.']
      redirect_to root_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  private

  def auth
    request.env["omniauth.auth"]
  end
  
end
