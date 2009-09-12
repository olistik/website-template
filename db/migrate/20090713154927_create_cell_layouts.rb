class CreateCellLayouts < ActiveRecord::Migration
  def self.up
    create_table :cell_layouts do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :cell_layouts
  end
end
