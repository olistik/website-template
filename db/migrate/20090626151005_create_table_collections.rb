class CreateTableCollections < ActiveRecord::Migration
    def self.up
        create_table :collections do |t|
            t.references :photo
            t.references :pubblication
            t.boolean :promote
        end
    end

    def self.down
        drop_table :collections
    end
end
