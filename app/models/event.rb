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

  def today?
    now = Time.now
    self.starts_at.getlocal >= now && self.starts_at < days_shift(1)
  end

  def week?
    now = Time.now
    self.starts_at.getlocal >= now && self.starts_at < days_shift(8)
  end

  def past?
    now = Time.now
    self.starts_at.getlocal < now
  end

  def duration_formated
    minutes = ((self.duration.to_f - self.duration.to_i.to_f) * 60).to_i.to_s
    if minutes == "0"
      self.duration.to_i.to_s + " h"
    else
      self.duration.to_i.to_s + " h " + minutes + " min"
    end
  end

  def username
    User.find(self.user_id).username
  end

  private

  def days_shift(days)
    now = Time.now
    Time.at((DateTime.new(now.year, now.month, now.day + days, 0, 0, 0, 0)).to_i - now.utc_offset)
  end

  def self.client_creator
    Google::APIClient.new
  end
end
