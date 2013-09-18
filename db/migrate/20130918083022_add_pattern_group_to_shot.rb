class AddPatternGroupToShot < ActiveRecord::Migration
  def change
    add_column :shots, :pattern_group_id, :integer
    add_index :shots, :pattern_group_id
  end
end
