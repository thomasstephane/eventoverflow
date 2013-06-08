class AuthenticationsController < ApplicationController
  def create
    auth = request.env['omniauth.auth']
    p auth
    if @user = User.find_by_username(auth['uid'])
      @user
    else
      User.create_with_omniauth(auth)
    end
    current_user
    flash[:notice] = "Success!"
    redirect_to '/'
  end

  def destroy

  end
end
