module UsersHelper < ApplicationHelper
  def current_user
    @current_user ||= User.find(session[:id])
  end
end
