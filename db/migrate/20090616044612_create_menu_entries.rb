class CreateMenuEntries < ActiveRecord::Migration
  def self.up
    create_table :menu_entries do |t|
      t.string :name
      t.integer :parent_id
      t.integer :cms_action_id

      t.timestamps
    end
  end

  def self.down
    drop_table :menu_entries
  end
end
