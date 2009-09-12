class CreateContactDetails < ActiveRecord::Migration
  def self.up
    create_table :contact_details do |t|
      t.integer :contact_id
      t.integer :contact_type_id
      t.string :content

      t.timestamps
    end
  end

  def self.down
    drop_table :contact_details
  end
end
