class AddNameToSeoPatterns < ActiveRecord::Migration
    def self.up
        add_column :seo_patterns, :name, :string
    end

    def self.down
        remove_column :seo_patterns, :name
    end
end
