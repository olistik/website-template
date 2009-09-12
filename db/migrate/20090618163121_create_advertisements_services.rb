class CreateAdvertisementsServices < ActiveRecord::Migration
    def self.up
        create_table :advertisements_services, :id => false do |t|
            t.references :advertisement
            t.references :service
        end
    end

    def self.down
        drop_table :advertisements_services
    end
end
