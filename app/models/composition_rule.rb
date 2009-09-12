# == Schema Information
#
# Table name: composition_rules
#
#  id             :integer(4)      not null, primary key
#  cell_layout_id :integer(4)
#  cell_action_id :integer(4)
#  previous_id    :integer(4)
#  created_at     :datetime
#  updated_at     :datetime
#  path_id        :integer(4)
#

class CompositionRule < ActiveRecord::Base
    belongs_to :cell_layout
    belongs_to :cell_action
    belongs_to :previous, :class_name => "CompositionRule"

# callbacks
# remember that without using transactions, multiple editings are not allowed
    before_destroy :prepare_for_destroy
    after_create :update_path_after_create

    include ModelHelper

    def cell_container
        cell_action.cell_container unless cell_action.nil?
    end

    def to_s
        id.to_s
    end

    def link_label
        id.to_s
    end

    def to_label
        content = [cell_layout.to_s, cell_action.to_s].join(" - ")
        order = "#{to_s}"
        order += " root" if previous.nil?
        "#{content} => #{order}"
    end

    def self.all_extended_for_select
        self.all.collect {|x| [x.to_label, x.id]}
    end

    def self.all_for_select
        self.all(:order => "cell_layout_id, cell_action_id").collect {|x| [x.to_label, x.id]}
    end

# path related
    def root_node
        CompositionRule.root_node(cell_layout)
    end

    def self.root_node(cell_layout)
        find_by_cell_layout_id_and_previous_id(cell_layout.id, nil)
    end

    def path
        CompositionRule.path(cell_layout)
    end

    def self.path(cell_layout)
        path_array = []
        path_array << root = root_node(cell_layout)
        path_array << root while root = root.next_node
        path_array
    end

    def self.cell_layouts
        all(:group => "cell_layout_id").collect {|rule| rule.cell_layout}
    end

    def self.paths
        paths_array = []
        for cell_layout in cell_layouts do
            paths_array << {
                :cell_layout => cell_layout,
                :path => path(cell_layout)
            }
        end
        paths_array
    end

    def path_size
        CompositionRule.path(cell_layout).size
    end

    def next_node
        CompositionRule.find_by_previous_id(id)
    end

    def has_next?
        !next_node.nil?
    end

    def is_root?
        previous.nil?
    end

# validation callbacks
#private
    def transient_path_size
        CompositionRule.find_all_by_cell_layout_id(cell_layout).size
    end

    def original_root_node
        conditions = ["cell_layout_id = ? and id != ?", cell_layout.id, id]
        CompositionRule.all(:conditions => conditions).first.root_node
    end

    def original_next_node
        conditions = ["previous_id = ? and id != ?", previous.id, id]
        CompositionRule.all(:conditions => conditions).first
    end

    def update_path_after_create
        if is_root?
            return if transient_path_size == 1
            original_root_node.update_attribute :previous_id, id
        else
            return unless original_next_node
            original_next_node.update_attribute :previous_id, id
        end
    end

    def prepare_for_destroy
        replacement = is_root? ? nil : previous.id
        next_node.update_attribute(:previous_id, replacement) if has_next?
    end
end
