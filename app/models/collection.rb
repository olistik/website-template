# == Schema Information
#
# Table name: collections
#
#  id          :integer(4)      not null, primary key
#  name        :string(255)
#  description :text
#  category_id :integer(4)
#  created_at  :datetime
#  updated_at  :datetime
#

class Collection < ActiveRecord::Base
    extend CommonSelect
    has_and_belongs_to_many :advertisements
    belongs_to :category

    include UpdateSlugs
    after_create :create_slugs
    after_update :update_slugs
    before_destroy :destroy_slugs

    def seo_category_id
        category.name
    end
end
