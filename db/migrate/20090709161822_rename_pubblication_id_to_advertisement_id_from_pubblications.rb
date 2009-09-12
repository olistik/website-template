class RenamePubblicationIdToAdvertisementIdFromPubblications < ActiveRecord::Migration
    class Pubblication < ActiveRecord::Base
    end

    def self.up
        Pubblication.delete_all
        rename_column :pubblications, :collection_id, :advertisement_id
    end

    def self.down
        Pubblication.delete_all
        rename_column :pubblications, :advertisement_id, :collection_id
    end
end
