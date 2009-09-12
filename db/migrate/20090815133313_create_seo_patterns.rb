class CreateSeoPatterns < ActiveRecord::Migration
    def self.up
        create_table :seo_patterns do |t|
            t.string :table_name
            t.string :url
            t.string :title
            t.string :keywords
            t.text :description
            t.text :tags
        end
    end

    def self.down
        drop_table :seo_patterns
    end
end
