# == Schema Information
#
# Table name: cell_containers
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  label      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class CellContainer < ActiveRecord::Base
    has_many :cell_actions, :dependent => :destroy

    extend CommonSelect
    include ModelHelper

    def value_for_cell_actions_size
        cell_actions.size
    end

    def link_label
        label
    end

    def to_s
        label
    end
end
