class Votes < ActiveRecord::Migration
	def change
		create_table :votes do |t|
     	t.string :voteable_type
     	t.integer :user_id
      t.integer :voteable_id

      t.timestamps
    end

	end
end
