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

  def gravatar_for(user)
    p user
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.username, class: "gravatar")
  end
end
