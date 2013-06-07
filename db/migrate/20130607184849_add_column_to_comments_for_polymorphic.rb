class AddColumnToCommentsForPolymorphic < ActiveRecord::Migration
  def change
    add_column :comments, :commentable, :string
    add_column :comments, :commentable, :integer
  end
end
