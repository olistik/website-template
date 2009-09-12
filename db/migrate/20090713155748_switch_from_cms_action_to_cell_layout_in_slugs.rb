class SwitchFromCmsActionToCellLayoutInSlugs < ActiveRecord::Migration
    class Slug < ActiveRecord::Base
    end

    def self.up        
        for slug in Slug.all do
            slug.cms_action_id = nil
            slug.save!
        end
        change_table :slugs do |t|
            t.rename :cms_action_id, :cell_layout_id
        end
    end

    def self.down
        for slug in Slug.all do
            slug.cell_layout_id = nil
            slug.save!
        end
        change_table :slugs do |t|
            t.rename :cell_layout_id, :cms_action_id
        end
    end
end
