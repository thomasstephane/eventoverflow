class ApplicationController < ActionController::Base

  protect_from_forgery
  include FormHelper
  include Authentication
  helper_method :current_user
  include VotesHelper

end
