class AdjustCmsActionsRoles < ActiveRecord::Migration
  def self.up
    rename_table :actions_roles, :cms_actions_roles
    change_table :cms_actions_roles do |t|
        t.rename :action_id, :cms_action_id
    end
  end

  def self.down
    change_table :cms_actions_roles do |t|
        t.rename :cms_action_id, :action_id
    end
    rename_table :cms_actions_roles, :actions_roles
  end
end
