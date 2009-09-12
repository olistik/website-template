# == Schema Information
# Schema version: 20090619154911
#
# Table name: customers
#
#  id           :integer(4)      not null, primary key
#  name         :string(255)
#  company_name :string(255)
#  vat          :string(255)
#  city_id      :integer(4)
#  address      :string(255)
#  civic_number :string(255)
#  telephone    :string(255)
#  email        :string(255)
#  referrer     :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

class Customer < ActiveRecord::Base
    belongs_to :city
    has_many :advertisements
    has_many :photos

    # TODO pack these in a unique call (something like resource_controller)
    include UpdateSlugs
    after_create :create_slugs
    after_update :update_slugs
    before_destroy :destroy_slugs
#    PatternNames = ["solo fornitore"]

    def self.all_for_select()
        self.all(:order => "company_name, name").collect do |customer|
            [customer.company_name + " - " + customer.name, customer.id]
        end
    end

    def seo_city_id
        city.name
    end

    def to_s
        "#{name}"
    end
end
