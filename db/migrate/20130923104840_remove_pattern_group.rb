class RemovePatternGroup < ActiveRecord::Migration
  def change
    remove_column :shots, :pattern_group_id
    drop_table :pattern_groups
  end
end
