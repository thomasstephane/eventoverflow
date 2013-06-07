class Vote < ActiveRecord::Base

  belongs_to :user
  belongs_to :votable, :polymorphic => true
  validates :votable_type, :inclusion => {:in => ["Event", "Comment"]}
  
  attr_accessible :counter, :votable_type, :votable_id, :user_id
  
  def updater(score)
    if self.counter == 0
      Vote.update(self.id, :counter => score)
    else
      Vote.update(self.id, :counter => 0)
    end
  end
end