class CreateCompositionRules < ActiveRecord::Migration
  def self.up
    create_table :composition_rules do |t|
      t.integer :cell_layout_id
      t.integer :cell_action_id
      t.integer :previous_id

      t.timestamps
    end
  end

  def self.down
    drop_table :composition_rules
  end
end
