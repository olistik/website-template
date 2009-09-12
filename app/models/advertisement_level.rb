# == Schema Information
#
# Table name: advertisement_levels
#
#  id   :integer(4)      not null, primary key
#  name :string(255)
#

class AdvertisementLevel < ActiveRecord::Base
    has_many :advertisements
    extend CommonSelect

    include UpdateSlugs
    after_create :create_slugs
    after_update :update_slugs
    before_destroy :destroy_slugs

    # uncomment to define patterns to be used
#    PatternNames = []

    # or uncomment this to defien your own way of creating slugs
#    def create_slugs
#        Slug.create! :seo_object => self, :seo_pattern => SeoPattern.find_pattern(pattern_name)
#    end
end
