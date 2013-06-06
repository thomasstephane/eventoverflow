class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  has_many   :votes, :as => :voteable
  attr_accessible :comment, :user_id, :event_id
end
