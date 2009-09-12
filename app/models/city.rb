# == Schema Information
# Schema version: 20090619154911
#
# Table name: cities
#
#  id          :integer(4)      not null, primary key
#  name        :string(255)
#  cap         :string(255)
#  province_id :integer(4)
#  created_at  :datetime
#  updated_at  :datetime
#

class City < ActiveRecord::Base
    extend CommonSelect
    belongs_to :province
    has_many :advertisements
    has_many :customers

    include UpdateSlugs
    after_create :create_slugs
    after_update :update_slugs
    before_destroy :destroy_slugs

    def self.all_by_province_id_for_select(province)
        self.all_for_select :province_id => province.id
    end

    def seo_province_id
        province.name
    end
end
