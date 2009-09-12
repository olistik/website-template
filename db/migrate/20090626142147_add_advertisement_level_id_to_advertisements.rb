class AddAdvertisementLevelIdToAdvertisements < ActiveRecord::Migration
    def self.up
        add_column :advertisements, :advertisement_level_id, :integer
    end

    def self.down
        remove_column :advertisements, :advertisement_level_id
    end
end
