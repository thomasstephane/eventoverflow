class Vote < ActiveRecord::Base
  attr_accessible :voteable_type
   
  validates :voteable_type, :presence => true
  validates :voteable_type, :inclusion => {:in => ["Event", "Comment"]}

  belongs_to :user
  belongs_to :voteable, :polymorphic => true

end
