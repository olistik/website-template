# == Schema Information
#
# Table name: services
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Service < ActiveRecord::Base
    extend CommonSelect
    has_and_belongs_to_many :categories
    has_and_belongs_to_many :advertisements
    has_one :seo_pattern, :as => :seo_object

    include UpdateSlugs
    after_create :create_slugs
    after_update :update_slugs
    before_destroy :destroy_slugs
end
