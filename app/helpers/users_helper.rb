module UsersHelper 
  def current_user
    @current_user ||= User.find(session[:id])
  end
end
