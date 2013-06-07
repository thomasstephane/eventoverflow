class Comment < ActiveRecord::Base

  belongs_to :user
  belongs_to :event
  belongs_to :commentable, :polymorphic => true
  has_many :votes, :as => :votable

  validates :commentable_type, :inclusion => {:in => ['Comment', 'User', 'Event']}

  attr_accessible :comment, :user_id, :event_id

  def sum_votes
    Vote.where("votable_id = ? AND votable_type = 'Comment'", self.id).sum('counter')
  end
end
