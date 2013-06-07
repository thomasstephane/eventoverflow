module Voteable
  def find_voteable 
    voteable = params[:voteable_type].classify.constantize.find params[:id]
    vote = Vote.new(:user_id => current_user.id)
    vote.voteable = voteable
    vote
  end
end