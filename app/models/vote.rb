class Vote < ActiveRecord::Base
  attr_accessible :counter, :votable_type, :votable_id, :user_id

  belongs_to :user
  belongs_to :votable, :polymorphic => true
  validates :voteable_type, :inclusion => {:in => ["Event", "Comment"]}
  


  def updater(score)
    if self.counter == 0
      Vote.update(self.id, :counter => score)
    else
      Vote.update(self.id, :counter => 0)
    end
  end
end