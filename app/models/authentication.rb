class Authentication < ActiveRecord::Base
  attr_accessible :uid

  belongs_to :users, :foreign_key => :uid
end
