# == Schema Information
# Schema version: 20090619154911
#
# Table name: macro_categories
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class MacroCategory < ActiveRecord::Base
    extend CommonSelect
    has_many :categories, :dependent => :destroy

    include UpdateSlugs
    after_create :create_slugs
    after_update :update_slugs
    before_destroy :destroy_slugs
end
