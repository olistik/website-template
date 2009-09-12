# == Schema Information
# Schema version: 20090619154911
#
# Table name: cms_actions
#
#  id                :integer(4)      not null, primary key
#  name              :string(255)
#  label             :string(255)
#  cms_controller_id :integer(4)
#  created_at        :datetime
#  updated_at        :datetime
#  state             :string(255)
#

class CmsAction < ActiveRecord::Base
    include Golem
    include FsmObject

    has_and_belongs_to_many :roles
    belongs_to :cms_controller
    has_many :menu_entries

    define_statemachine do
        initial_state :EMPTY
        state :EMPTY do
            on :next, :to => :HAS_CMS_CONTROLLER
        end
        state :HAS_CMS_CONTROLLER do
            on :next, :to => :COMPLETED
        end
        state :COMPLETED do
            on :change_cms_controller, :to => :HAS_CMS_CONTROLLER
            on :change_cms_action, :to => :COMPLETED
        end
    end

    def authorize?(user)
        authorization_count = CmsAction.all(
            :joins => "
                JOIN cms_actions_roles ON cms_actions_roles.role_id = cms_actions.id
                JOIN roles_users ON cms_actions_roles.role_id = roles_users.role_id
            ", :conditions => {
                'roles_users.user_id' => user.id,
                'cms_actions.id' => self.id
            }
        ).count()
        return authorization_count > 0
    end

    def self.find_current(cms_controller_name, cms_action_name)
        current_cms_controller = CmsController.find_by_name(cms_controller_name)
        return nil if current_cms_controller.nil?
        current_cms_action = CmsAction.first([
            :name => cms_action_name,
            :cms_controller_id => current_cms_controller.id
        ])
        return current_cms_action
    end

    def self.all_for_select()
        self.all_ordered_by_cms_controller.collect do |cms_action|
            if not %w( destroy create update show edit ).include? cms_action.name
                [cms_action.cms_controller.name + " - " + cms_action.name, cms_action.id]
            end
        end
    end

    def self.all_ordered_by_cms_controller()
        self.all(
            :joins => :cms_controller,
            :order => "cms_controllers.name, cms_actions.name"
        )
    end

    def self.empty?
        self.all.size == 0
    end
end
