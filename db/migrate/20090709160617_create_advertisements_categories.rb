class CreateAdvertisementsCategories < ActiveRecord::Migration
    def self.up
        create_table :advertisements_categories, :id => false do |t|
            t.references :advertisement
            t.references :category
        end
    end

    def self.down
        drop_table :advertisements_categories
    end
end
