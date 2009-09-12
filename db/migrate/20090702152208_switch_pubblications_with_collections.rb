class SwitchPubblicationsWithCollections < ActiveRecord::Migration
    def self.up
        rename_table :pubblications, :temp
        change_table :collections do |t|
            t.rename :pubblication_id, :collection_id
        end
        rename_table :collections, :pubblications
        rename_table :temp, :collections
    end

    def self.down
        rename_table :collections, :temp
        change_table :pubblications do |t|
            t.rename :collection_id, :pubblication_id
        end
        rename_table :pubblications, :collections
        rename_table :temp, :pubblications
    end
end
