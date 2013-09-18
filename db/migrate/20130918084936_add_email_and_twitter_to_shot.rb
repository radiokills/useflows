class AddEmailAndTwitterToShot < ActiveRecord::Migration
  def change
    add_column :shots, :email, :string, null: true
    add_column :shots, :tw_handler, :string, null: true
  end
end
