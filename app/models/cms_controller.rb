# == Schema Information
# Schema version: 20090619154911
#
# Table name: cms_controllers
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class CmsController < ActiveRecord::Base
    extend CommonSelect

    DEFAULT_CONTROLLERS = [
        "application", "user_sessions", "rails/info", "rails_info"
    ]
    has_many :cms_actions, :dependent => :destroy

    # to be called only when rendering an action
    def available_cms_action_names()
        cms_controller_name = self.name.camelize().pluralize() + "Controller"
        return cms_controller_name.constantize()::instance_methods(false)
    end

    def cms_actions_left()
        actions_left = []
        for cms_action_name in available_cms_action_names() do
            if not %w( destroy create update show edit ).include? cms_action_name
                actions_left.push(cms_action_name) unless self.cms_actions.find_by_name(cms_action_name)
            end
        end
        return actions_left
    end

    # WARNING can't be tested simply since it relies on ActionController
    def self.cms_controllers_left()
        available = ActionController::Routing::possible_controllers() - DEFAULT_CONTROLLERS
        controllers_left = []
        for cms_controller_name in available do
            controllers_left.push(cms_controller_name) unless self.find_by_name(cms_controller_name)
        end
        return controllers_left
    end

    def self.create_remaining
        cms_controllers_created = 0
        for cms_controller_name in self.cms_controllers_left do
            cms_controllers_created += 1 if self.create(:name => cms_controller_name)
        end
        return cms_controllers_created
    end

    def self.empty?
        self.all.size == 0
    end
end
