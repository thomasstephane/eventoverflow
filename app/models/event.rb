class Event < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  attr_accessible :title, :description, :starts_at, :duration, :location
end
