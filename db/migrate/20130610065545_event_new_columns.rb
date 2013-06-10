class EventNewColumns < ActiveRecord::Migration
  def change
    add_column :events, :extern_id, :integer
    add_column :events, :phone, :string
    add_column :events, :guid, :string
    add_column :events, :link, :string
    add_column :events, :creator, :string
    add_column :events, :lat, :string
    add_column :events, :long, :string
    add_column :events, :venue_name, :string
    add_column :events, :street, :string
    add_column :events, :city, :string
    add_column :events, :region, :string
    add_column :events, :zip, :integer
    add_column :events, :country, :string
    add_column :events, :recurrence, :string
    add_column :events, :image_url, :string
  end
end
