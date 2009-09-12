# == Schema Information
# Schema version: 20090619154911
#
# Table name: categories
#
#  id                :integer(4)      not null, primary key
#  name              :string(255)
#  macro_category_id :integer(4)
#  created_at        :datetime
#  updated_at        :datetime
#

class Category < ActiveRecord::Base
    extend CommonSelect
    has_and_belongs_to_many :services
    has_and_belongs_to_many :advertisements
    has_many :collections
    belongs_to :macro_category

    include UpdateSlugs
    after_create :create_slugs
    after_update :update_slugs
    before_destroy :destroy_slugs

    def seo_macro_category_id
        macro_category.name
    end
end
