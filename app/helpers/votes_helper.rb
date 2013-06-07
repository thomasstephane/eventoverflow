module VotesHelper

  def find_votable(params)
    votable_id = params[:comment_id] 
    votable_id ? Comment.find(votable_id) : Event.find(params[:event_id])
  end

  def event_id(votable)
    if votable.is_a?(Comment)
      votable.event_id
    else
      votable.id
    end
  end
end

