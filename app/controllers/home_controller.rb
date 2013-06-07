class HomeController < ApplicationController

  def index
    @user = User.new
    @events = Event.all
  end
end
