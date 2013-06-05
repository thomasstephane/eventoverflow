class User < ActiveRecord::Base
  attr_accessible :username, :password_digest

  has_many :events
  has_many :comments
  has_many :events, :through => :comments
end
