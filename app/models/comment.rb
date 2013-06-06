class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  attr_accessible :comment, :user_id, :event_id
end
