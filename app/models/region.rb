# == Schema Information
# Schema version: 20090619154911
#
# Table name: regions
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  nation_id  :integer(4)
#  created_at :datetime
#  updated_at :datetime
#

class Region < ActiveRecord::Base
    extend CommonSelect
    has_many :provinces, :dependent => :destroy
    belongs_to :nation

    include UpdateSlugs
    after_create :create_slugs
    after_update :update_slugs
    before_destroy :destroy_slugs

    def self.all_by_nation_id_for_select(nation)
        self.all_for_select :nation_id => nation.id
    end
end
