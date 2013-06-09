module UsersHelper 
  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end

  def gravatar_for(user)
    p user
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.username, class: "gravatar")
  end
end
