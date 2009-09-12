class CreateCategoriesServices < ActiveRecord::Migration
    def self.up
        create_table :categories_services, :id => false do |t|
            t.references :category
            t.references :service
        end
    end

    def self.down
        drop_table :categories_services
    end
end
