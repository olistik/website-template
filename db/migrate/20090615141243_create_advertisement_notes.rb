class CreateAdvertisementNotes < ActiveRecord::Migration
  def self.up
    create_table :advertisement_notes do |t|
      t.text :content
      t.integer :advertisement_id

      t.timestamps
    end
  end

  def self.down
    drop_table :advertisement_notes
  end
end
