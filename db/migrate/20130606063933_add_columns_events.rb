class AddColumnsEvents < ActiveRecord::Migration
  def change
    add_column :events, :starts_at, :datetime
    add_column :events, :duration, :integer
    add_column :events, :location, :text
  end
end
