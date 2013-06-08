class CreateEventConfirmations < ActiveRecord::Migration
  def change
    create_table :event_confirmations do |t|
      t.integer :user_id, :event_id
      t.string :decision

      t.timestamps
    end
  end
end
