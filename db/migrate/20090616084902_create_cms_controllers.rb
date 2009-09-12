class CreateCmsControllers < ActiveRecord::Migration
  def self.up
    create_table :cms_controllers do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :cms_controllers
  end
end
