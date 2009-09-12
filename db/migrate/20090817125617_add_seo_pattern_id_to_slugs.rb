class AddSeoPatternIdToSlugs < ActiveRecord::Migration
    def self.up
        add_column :slugs, :seo_pattern_id, :integer
    end

    def self.down
        remove_column :slugs, :seo_pattern_id
    end
end
