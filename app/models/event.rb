class Event < ActiveRecord::Base

  belongs_to :user
  has_many :comments, :as => :commentable
  has_many :votes, :as => :votable

  attr_accessible :title, :description, :starts_at, :duration, :location

  def sum_votes
    Vote.where("votable_id = ? AND votable_type = 'Event'", self.id).sum('counter')
  end

  def all_comments
    Comment.where(event_id: self.id)
  end
end
