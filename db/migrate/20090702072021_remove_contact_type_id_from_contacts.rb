class RemoveContactTypeIdFromContacts < ActiveRecord::Migration
    def self.up
        remove_column :contacts, :contact_type_id
    end

    def self.down
        add_column :contacts, :contact_type_id, :integer
    end
end
