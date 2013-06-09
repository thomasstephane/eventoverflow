module UsersHelper 
  def current_user
    if session[:user_id]
      return @current_user ||= User.find(session[:user_id])
    end
    false
  end

  def view_link(event)
    if current_user
      return current_user.id == event.user_id || current_user.admin
    end
    false
  end
end
