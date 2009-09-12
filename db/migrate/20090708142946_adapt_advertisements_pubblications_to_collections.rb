class AdaptAdvertisementsPubblicationsToCollections < ActiveRecord::Migration
    def self.up
        rename_table :advertisements_pubblications, :advertisements_collections
        change_table :advertisements_collections do |t|
            t.rename :pubblication_id, :collection_id
        end
    end

    def self.down
        rename_table :advertisements_collections, :advertisements_pubblications
        change_table :advertisements_pubblications do |t|
            t.rename :collection_id, :pubblication_id
        end
    end
end
