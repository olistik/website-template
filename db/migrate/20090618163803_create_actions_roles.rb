class CreateActionsRoles < ActiveRecord::Migration
    def self.up
        create_table :actions_roles, :id => false do |t|
            t.references :action
            t.references :role
        end
    end

    def self.down
        drop_table :actions_roles
    end
end
