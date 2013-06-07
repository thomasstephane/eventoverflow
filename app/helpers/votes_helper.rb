module VotesHelper

  def find_votable(params)
    votable_id = params[:answer_id] 
    votable_id ? Answer.find(votable_id) : Question.find(votable_id)
  end

  def q_id(votable)
    if votable.class.is_a? 'Answer'
      votable.question_id
    else
      votable.id
    end
  end
end

