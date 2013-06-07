class VotesController < ApplicationController

  def upvote
    voter(params, 1)
  end

  def downvote
    voter(params, -1)
  end

  private

  def voted(votable)
    votable.votes.find_by_user_id(current_user.id)
  end

  def voter(params, score)
    votable = find_votable(params)
    event_id = event_id(votable)
    vote = voted(votable)
    if vote
      vote.updater(score)
    else
      votable.votes << Vote.create(user_id: current_user.id, counter: score)
    end
    event = Event.find(event_id)
    redirect_to event_path(event)
  end
end