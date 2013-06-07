class Vote < ActiveRecord::Base
  attr_accessible :counter, :votable_type, :votable_id, :user_id

  belongs_to :user
  belongs_to :votable, :polymorphic => true
  validates :voteable_type, :inclusion => {:in => ["Event", "Comment"]}
  
end