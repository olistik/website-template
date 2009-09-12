class RemoveServiceTypeIdFromAdvertisements < ActiveRecord::Migration
    def self.up
        remove_column :advertisements, :service_type_id
    end

    def self.down
        add_column :advertisements, :service_type_id, :integer
    end
end
