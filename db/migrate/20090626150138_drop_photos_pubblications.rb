class DropPhotosPubblications < ActiveRecord::Migration
    def self.up
        drop_table :photos_pubblications
    end

    def self.down
        create_table :photos_pubblications, :id => false do |t|
            t.references :pubblication
            t.references :photo
        end
    end
end
