class CreateAdvertisementsPubblications < ActiveRecord::Migration
    def self.up
        create_table :advertisements_pubblications, :id => false do |t|
            t.references :advertisement
            t.references :pubblication
        end
    end

    def self.down
        drop_table :advertisements_pubblications
    end
end
