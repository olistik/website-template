# == Schema Information
#
# Table name: advertisements
#
#  id                     :integer(4)      not null, primary key
#  customer_id            :integer(4)
#  name                   :string(255)
#  city_id                :integer(4)
#  address                :string(255)
#  civic_number           :string(255)
#  start_date             :date
#  end_date               :date
#  contact_id             :integer(4)
#  description            :text
#  created_at             :datetime
#  updated_at             :datetime
#  advertisement_level_id :integer(4)
#

class Advertisement < ActiveRecord::Base
    extend CommonSelect
    belongs_to :customer
    belongs_to :city
    belongs_to :contact
    belongs_to :advertisement_level
    has_and_belongs_to_many :collections
    has_and_belongs_to_many :services
    has_and_belongs_to_many :categories
    has_many :notes, :class_name => "AdvertisementNote", :dependent => :destroy
    accepts_nested_attributes_for :notes, :allow_destroy => true
    has_many :pubblications, :dependent => :destroy
    has_many :photos, :through => :pubblications

    include UpdateSlugs
    after_create :create_slugs
    after_update :update_slugs
    before_destroy :destroy_slugs

    def seo_city_id
        city.name
    end
end
