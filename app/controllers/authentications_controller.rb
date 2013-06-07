class AuthenticationsController < ApplicationController
  def create
    auth = request.env['omniauth.auth']
    current_user.authentications.find_or_create_by_uid(auth['uid'])
    flash[:notice] = "Success!"
    redirect_to user_path
  end

  def destroy
    
  end
end
