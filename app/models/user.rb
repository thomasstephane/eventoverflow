class User < ActiveRecord::Base
  has_secure_password

  has_many :events
  has_many :comments
  has_many :events, :through => :comments

  attr_accessible :username, :password, :password_confirmation, :password_digest
  validates :username, :presence => true
end
