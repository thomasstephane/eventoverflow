class ApplicationController < ActionController::Base
  protect_from_forgery

  include UsersHelper
  include VotesHelper
  include FormHelper
end
