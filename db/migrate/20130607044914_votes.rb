class Votes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.string :votable_type
      t.integer :votable_id, :user_id, :counter

      t.timestamps
    end
  end
end
