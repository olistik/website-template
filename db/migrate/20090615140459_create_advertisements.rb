class CreateAdvertisements < ActiveRecord::Migration
  def self.up
    create_table :advertisements do |t|
      t.integer :customer_id
      t.integer :category_id
      t.integer :service_type_id
      t.string :name
      t.integer :city_id
      t.string :address
      t.string :civic_number
      t.date :start_date
      t.date :end_date
      t.integer :contact_id
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :advertisements
  end
end
