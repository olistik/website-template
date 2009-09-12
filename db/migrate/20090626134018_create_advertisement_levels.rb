class CreateAdvertisementLevels < ActiveRecord::Migration
    def self.up
        create_table :advertisement_levels do |t|
            t.string :name
        end
    end

    def self.down
        drop_table :advertisement_levels
    end
end
