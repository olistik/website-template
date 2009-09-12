class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      t.string :name
      t.string :url
      t.decimal :rating
      t.integer :viewed
      t.integer :customer_id

      t.timestamps
    end
  end

  def self.down
    drop_table :photos
  end
end
