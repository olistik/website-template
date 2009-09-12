class MoveCellLayoutIdFromSlugsToSeoPatterns < ActiveRecord::Migration
    def self.up
        remove_column :slugs, :cell_layout_id
        add_column :seo_patterns, :cell_layout_id, :integer
    end

    def self.down
        remove_column :seo_patterns, :cell_layout_id
        add_column :slugs, :cell_layout_id, :integer
    end
end
