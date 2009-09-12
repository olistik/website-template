# == Schema Information
# Schema version: 20090619154911
#
# Table name: nations
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Nation < ActiveRecord::Base
    extend CommonSelect
    has_many :regions, :dependent => :destroy

    include UpdateSlugs
    after_create :create_slugs
    after_update :update_slugs
    before_destroy :destroy_slugs
end
