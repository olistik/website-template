# == Schema Information
# Schema version: 20090619154911
#
# Table name: menu_entries
#
#  id            :integer(4)      not null, primary key
#  name          :string(255)
#  parent_id     :integer(4)
#  cms_action_id :integer(4)
#  created_at    :datetime
#  updated_at    :datetime
#

# TODO when inserting new entries check for recursive loops
class MenuEntry < ActiveRecord::Base
    include ActionController::UrlWriter
    default_url_options[:host] = 'test'
    validate :valid_url?

    belongs_to :cms_action
    belongs_to :parent, :class_name => "MenuEntry"
    has_many :children, :class_name => "MenuEntry", :foreign_key => :parent_id, :dependent => :destroy

    def self.main_entries
        return self.find_all_by_parent_id(nil)
    end
    
    def self.all_ordered_by_cms_controller_and_cms_action
        self.all(
            :joins => "
                LEFT JOIN cms_actions
                    ON cms_actions.id = menu_entries.cms_action_id
                LEFT JOIN cms_controllers
                    ON cms_actions.cms_controller_id = cms_controllers.id
            ", :order => "cms_controllers.name, cms_actions.name"
        )
    end

    def valid_url?
        return true if self.cms_action.nil?
        begin
            url_for(
                :controller => self.cms_action.cms_controller.name,
                :action => self.cms_action.name
            )
        rescue
            errors.add(:cms_action, "Invalid combination of Controller/Action")
            return false
        end
        return true
    end

    def self.all_for_select
        self.all_ordered_by_cms_controller_and_cms_action.collect do |menu_entry|
            [menu_entry.name, menu_entry.id]
        end
    end

    def self.empty?
        self.all.size == 0
    end
end
