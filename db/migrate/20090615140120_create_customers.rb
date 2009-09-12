class CreateCustomers < ActiveRecord::Migration
  def self.up
    create_table :customers do |t|
      t.string :name
      t.string :company_name
      t.string :vat
      t.integer :city_id
      t.string :address
      t.string :civic_number
      t.string :telephone
      t.string :email
      t.string :referrer

      t.timestamps
    end
  end

  def self.down
    drop_table :customers
  end
end
