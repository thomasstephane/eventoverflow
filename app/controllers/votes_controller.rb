class VotesController < ApplicationController

  def create
    @votes = Vote.create(params[:voteable_type])
  end

end
