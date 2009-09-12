# == Schema Information
#
# Table name: cell_actions
#
#  id                :integer(4)      not null, primary key
#  name              :string(255)
#  label             :string(255)
#  cell_container_id :integer(4)
#  created_at        :datetime
#  updated_at        :datetime
#

class CellAction < ActiveRecord::Base
    belongs_to :cell_container
    has_many :composition_rules
    has_many :cell_layouts, :through => :composition_rules

    extend CommonSelect
    include ModelHelper

    def value_for_cell_layouts_size
        cell_layouts.size
    end

    def link_label
        label
    end

    def to_s
        label
    end

    def to_label
        cell_container.to_s + " > " + to_s
    end

    def self.all_extended_for_select
        self.all.collect {|x| [x.to_label, x.id]}
    end
end
