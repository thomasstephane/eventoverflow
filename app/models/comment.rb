class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  has_many :votes, :as => :votable
  attr_accessible :comment, :user_id, :event_id

  def sum_votes
    Vote.where("votable_id = ? AND votable_type = ?", self.id, self.class).sum('counter')
  end
end
