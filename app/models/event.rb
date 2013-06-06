class Event < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :votes, :as => :voteable
  attr_accessible :title, :description, :starts_at, :duration, :location, :user_id
end
