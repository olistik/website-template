class CreateCellContainers < ActiveRecord::Migration
  def self.up
    create_table :cell_containers do |t|
      t.string :name
      t.string :label

      t.timestamps
    end
  end

  def self.down
    drop_table :cell_containers
  end
end
