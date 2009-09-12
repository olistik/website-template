class CreatePubblications < ActiveRecord::Migration
  def self.up
    create_table :pubblications do |t|
      t.string :name
      t.text :description
      t.integer :advertisement_id
      t.integer :category_id

      t.timestamps
    end
  end

  def self.down
    drop_table :pubblications
  end
end
