class SessionController < ApplicationController
  def create
    @user = User.find_by_username(params[:username])

    if @user && @user.authenticate(params[:password])
      session[:id] = @user.id
      redirect_to user_path(@user)
    else
      @login_error = 'Invalid username or password.'

      render '/users/login.html.erb'
    end
  end

  def destroy
    session.clear
    redirect_to root_url
  end
end
