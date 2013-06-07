class Authentication < ActiveRecord::Base
  attr_accessible :uid

  belongs_to :user, :foreign_key => :uid
end
