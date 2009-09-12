class CreateCmsActions < ActiveRecord::Migration
  def self.up
    create_table :cms_actions do |t|
      t.string :name
      t.string :label
      t.integer :cms_controller_id

      t.timestamps
    end
  end

  def self.down
    drop_table :cms_actions
  end
end
