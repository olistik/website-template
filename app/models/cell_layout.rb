# == Schema Information
#
# Table name: cell_layouts
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class CellLayout < ActiveRecord::Base
    has_many :seo_patterns
    has_many :composition_rules
    has_many :cell_actions, :through => :composition_rules

    extend CommonSelect
    include ModelHelper

    def value_for_seo_patterns_size
        seo_patterns.size
    end

    def link_label
        name
    end

    def to_s
        name
    end
end
