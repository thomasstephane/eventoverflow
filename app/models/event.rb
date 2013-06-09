class Event < ActiveRecord::Base

  belongs_to :user
  has_many :comments, :as => :commentable
  has_many :votes, :as => :votable
  has_many :event_confirmations
  has_many :users, :through => :event_confirmations

  attr_accessible :title, :description, :starts_at, :duration, :location, :user_id
  def sum_votes
    Vote.where("votable_id = ? AND votable_type = 'Event'", self.id).sum('counter')
  end

  def all_comments
    Comment.where(event_id: self.id)
  end

  def upcoming?
    now = Time.now
    self.starts_at >= now
  end

  def past?
    now = Time.now
    self.starts_at < now
  end
end
