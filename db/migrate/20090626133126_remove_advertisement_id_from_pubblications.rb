class RemoveAdvertisementIdFromPubblications < ActiveRecord::Migration
    def self.up
        remove_column :pubblications, :advertisement_id
    end

    def self.down
        add_column :pubblications, :advertisement_id, :integer
    end
end
