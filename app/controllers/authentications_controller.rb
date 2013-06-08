class AuthenticationsController < ApplicationController
  def create
    auth = request.env['omniauth.auth']
    if @user = User.find_by_username(auth['uid'])
      @user
    else
      @user = User.create_with_omniauth(auth)
      token = auth['credentials']['token']
      client = Google::APIClient.new
      client.authorization.access_token = token
      service = client.discovered_api('calendar', 'v3')
      @result = client.execute(
        :api_method => service.calendar_list.list,
        :parameters => {},
        :headers => {'Content-Type' => 'application/json'})
    end
    session[:user_id] = @user.id
    current_user
    flash[:notice] = "Success!"
    redirect_to '/'
  end

  def destroy

  end
end
