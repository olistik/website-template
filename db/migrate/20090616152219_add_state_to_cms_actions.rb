class AddStateToCmsActions < ActiveRecord::Migration
    def self.up
        add_column :cms_actions, :state, :string
    end

    def self.down
        remove_column :cms_actions, :state
    end
end
