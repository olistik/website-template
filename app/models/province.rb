# == Schema Information
# Schema version: 20090619154911
#
# Table name: provinces
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  region_id  :integer(4)
#  created_at :datetime
#  updated_at :datetime
#

class Province < ActiveRecord::Base
    extend CommonSelect
    has_many :cities, :dependent => :destroy
    belongs_to :region

    include UpdateSlugs
    after_create :create_slugs
    after_update :update_slugs
    before_destroy :destroy_slugs

    def self.all_by_region_id_for_select(region)
        self.all_for_select :region_id => region.id
    end

    def seo_region_id
        region.name
    end
end
