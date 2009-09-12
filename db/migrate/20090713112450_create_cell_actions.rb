class CreateCellActions < ActiveRecord::Migration
  def self.up
    create_table :cell_actions do |t|
      t.string :name
      t.string :label
      t.integer :cell_container_id

      t.timestamps
    end
  end

  def self.down
    drop_table :cell_actions
  end
end
