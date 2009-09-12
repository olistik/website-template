class RemoveCategoryIdFromAdvertisements < ActiveRecord::Migration
  def self.up
    remove_column :advertisements, :category_id
  end

  def self.down
    add_column :advertisements, :category_id, :integer
  end
end
