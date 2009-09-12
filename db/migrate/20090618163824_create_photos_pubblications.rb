class CreatePhotosPubblications < ActiveRecord::Migration
    def self.up
        create_table :photos_pubblications, :id => false do |t|
            t.references :photo
            t.references :pubblication
        end
    end

    def self.down
        drop_table :photos_pubblications
    end
end
