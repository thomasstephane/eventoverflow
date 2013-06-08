class SessionController < ApplicationController
  def create
    @user = User.find_by_username(params[:username])
    if auth
     google_user = User.find_or_create_user_by_uid(auth)
     session[:user_id] = google_user.id
     redirect_to user_path(google_user)
    elsif @user && @user.authenticate(params[:password])
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

  # def omniauth_failure
  #   flash[:notice] = "Fail B!"
  #   redirect_to root_path
  # end

  private

  def find_user_by_uid
    User.find_by_uid(auth["uid"])
  end

  def create_user_by_uid
    User.create_with_omniauth(auth)
  end

  def find_or_create_user_by_uid
    @user = find_user_by_uid || create_user_by_uid
  end

  def auth
    request.env["omniauth.auth"]
  end
end
