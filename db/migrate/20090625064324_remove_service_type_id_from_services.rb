class RemoveServiceTypeIdFromServices < ActiveRecord::Migration
    def self.up
        remove_column :services, :service_type_id
    end

    def self.down
        add_column :services, :service_type_id, :integer
    end
end
