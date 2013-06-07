class Authentications < ActiveRecord::Migration
  def change 
    create_table :authentications do |t|
      t.integer :uid

      t.timestamps
    end
  end
end
