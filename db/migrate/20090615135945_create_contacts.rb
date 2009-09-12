class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :contacts do |t|
      t.string :name
      t.integer :contact_type_id

      t.timestamps
    end
  end

  def self.down
    drop_table :contacts
  end
end
