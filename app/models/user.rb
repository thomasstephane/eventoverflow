class User < ActiveRecord::Base
  attr_accessible :username, :password, :password_confirmation, :password_digest

  has_secure_password
  
  has_many :created_events, :class_name => 'Event'
  has_many :comments
  has_many :commented_events, :through => :comments, :class_name => "Event", :source => :event
  has_many :votes

  validates :username, :presence => true
end
