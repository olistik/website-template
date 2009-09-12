class CreateRegions < ActiveRecord::Migration
  def self.up
    create_table :regions do |t|
      t.string :name
      t.integer :nation_id

      t.timestamps
    end
  end

  def self.down
    drop_table :regions
  end
end
