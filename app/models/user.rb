class User < ActiveRecord::Base
  attr_accessible :username, :password, :password_confirmation, :password_digest

  has_secure_password

  has_many :events
  has_many :comments
  has_many :events, :through => :comments

  validates :username, :presence => true
end
