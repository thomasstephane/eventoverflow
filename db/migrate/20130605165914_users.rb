class Users < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, :password_digest
      t.timestamps
    end
  end
end
