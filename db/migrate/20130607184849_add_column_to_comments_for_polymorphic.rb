class AddColumnToCommentsForPolymorphic < ActiveRecord::Migration
  def change
    add_column :comments, :votable_type, :string
    add_column :comments, :votable_id, :integer
  end
end
