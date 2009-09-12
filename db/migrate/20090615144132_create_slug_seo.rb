class CreateSlugSeo < ActiveRecord::Migration
  def self.up
    create_table :slug_seo do |t|
      t.integer :slug_id
      t.string :title
      t.string :keywords
      t.text :description
      t.text :tags

      t.timestamps
    end
  end

  def self.down
    drop_table :slug_seo
  end
end
