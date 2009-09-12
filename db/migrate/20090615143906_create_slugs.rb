class CreateSlugs < ActiveRecord::Migration
  def self.up
    create_table :slugs do |t|
      t.string :name
      t.integer :cms_action_id
      t.text :data

      t.timestamps
    end
  end

  def self.down
    drop_table :slugs
  end
end
