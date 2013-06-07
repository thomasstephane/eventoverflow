class AuthenticationsController < ApplicationController
  def create
    auth = request.env['omniauth.auth']
    p auth
    @authentication = Authentication.find_by_uid(auth[uid])
    if @authentication
      render :text => 'Welcome back'
    else     
    if @user = User.find_by_username(auth['uid'])
    #   @user
    # else
      # User.create_with_omniauth(auth)
    end
    flash[:notice] = "Success!"
    redirect_to '/'
  end

  def destroy

  end
end
