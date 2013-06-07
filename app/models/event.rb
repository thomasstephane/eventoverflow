class Event < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :votes, :as => :votable

  attr_accessible :title, :description, :starts_at, :duration, :location

  def sum_votes
    Vote.where("votable_id = ? AND votable_type = ?", self.id, self.class).sum('counter')
  end
end
