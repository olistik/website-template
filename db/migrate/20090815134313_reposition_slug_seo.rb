class RepositionSlugSeo < ActiveRecord::Migration
    def self.up
        drop_table :slug_seo
        change_table :slugs do |t|
            t.string :title
            t.string :keywords
            t.text :description
            t.text :tags
            t.integer :seo_object_id
            t.string :seo_object_type
        end
        rename_column :slugs, :name, :url
    end

    def self.down
        create_table :slug_seo do |t|
          t.integer :slug_id
          t.string :title
          t.string :keywords
          t.text :description
          t.text :tags
          t.timestamps
        end
        change_table :slugs do |t|
            t.remove :title, :keywords, :description, :tags, :seo_object_id,
                :seo_object_type
        end
        rename_column :slugs, :url, :name
    end
end
