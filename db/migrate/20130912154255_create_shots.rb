class CreateShots < ActiveRecord::Migration
  def change
    create_table :shots do |t|
      t.string :image
      t.string :url

      t.integer :visible, default: 0, null: false
      t.text :description, null: true

      t.timestamps
    end
  end
end
