class CreateSlugNavigators < ActiveRecord::Migration
  def self.up
    create_table :slug_navigators do |t|
      t.integer :slug_id
      t.integer :parent_id
      t.string :alt
      t.string :content

      t.timestamps
    end
  end

  def self.down
    drop_table :slug_navigators
  end
end
