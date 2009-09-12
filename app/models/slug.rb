# == Schema Information
#
# Table name: slugs
#
#  id              :integer(4)      not null, primary key
#  url             :string(255)
#  data            :text
#  created_at      :datetime
#  updated_at      :datetime
#  title           :string(255)
#  keywords        :string(255)
#  description     :text
#  tags            :text
#  seo_object_id   :integer(4)
#  seo_object_type :string(255)
#  seo_pattern_id  :integer(4)
#

class Slug < ActiveRecord::Base
    include ModelHelper
    require 'cgi'

    has_one :slug_navigator
    belongs_to :seo_object, :polymorphic => true
    belongs_to :seo_pattern

    before_save :apply_pattern

    def apply_pattern
        return if seo_object.nil? || seo_pattern.nil?
        for field in %w(title keywords description tags url) do
            field_pattern = seo_pattern.send(field)
            for pattern_attribute in seo_pattern.pattern_attributes do
                field_pattern = seo_pattern.apply(field_pattern, pattern_attribute, field, seo_object)
                send(field.to_s + "=", field_pattern)
            end
        end
    end

    def self.update_slugs(seo_object_type)
        slugs = find_all_by_seo_object_type(seo_object_type)
        for slug in slugs do
            slug.save!
        end
    end

    def param_data
        return [] if self.data.nil?
        self.data.split("&").map! do |couple|
            result = {}
            (result[:name], result[:value]) = couple.split("=").map! do |attribute|
                CGI.unescape(attribute)
            end
            result
        end
    end

    def param_data=(parameters)
        result = []
        for couple in parameters.values() do
            result.push(CGI.escape(couple[:name]) + "=" + CGI.escape(couple[:value]))
        end
        self.data = result.join("&")
        save!
    end

    def to_s
        url
    end
end
