# == Schema Information
#
# Table name: seo_patterns
#
#  id             :integer(4)      not null, primary key
#  table_name     :string(255)
#  url            :string(255)
#  title          :string(255)
#  keywords       :string(255)
#  description    :text
#  tags           :text
#  name           :string(255)
#  cell_layout_id :integer(4)
#

class SeoPattern < ActiveRecord::Base
    has_many :slugs
    belongs_to :cell_layout

    include ModelHelper

    after_save :update_slugs

    List = {
        :advertisement_levels => [:name],
        :advertisements => [:id, :name, :city_id],
        #:advertisements_categories => [:category_id], #WTF?! join table?!
        :categories => [:name, :macro_category_id],
        #:categories_services => [:category_id], #WTF?! join table?!
        :cities => [:name, :province_id],
        :collections => [:name, :category_id],
        :customers => [:name, :company_name, :city_id],
        :macro_categories => [:name],
        :nations => [:name],
        :provinces => [:name, :region_id],
        :regions => [:name],
        :services => [:name]
    }

    DefaultPatternName = "DEFAULT_PATTERN"

    def apply(pattern, attribute, field, object)
        method_name = attribute.to_s
        if object.class.instance_methods.include?("seo_" + attribute.to_s)
            method_name = "seo_" + method_name
        end
        value = object.send(method_name)
        pattern.gsub(self.class.attribute_pattern_format(attribute), value.to_s)
    end

    def self.attribute_pattern_format(attribute)
        "___#{attribute}___"
    end

    def self.get_table_names
        self::List.keys.collect {|table_name| table_name.to_s}
    end

    def self.all_object_types
        self::List.keys.collect {|table_name| table_name.to_s.classify}
    end

    def pattern_names
        patterns = self.class.find_all_by_table_name(table_name)
        names = patterns.collect {|pattern| pattern.name}
    end

    def self.all_for_select
        self.all.collect {|x| ["#{x.table_name} - #{x.name}", x.id]}
    end

    def update_slugs
        Slug.update_slugs(table_name.classify)
    end

    def pattern_attributes
        List[table_name.to_sym]
    end

    def value_for_slugs_size
        slugs.size
    end

    def to_s
        "#{table_name} - #{name}"
    end

    def self.find_default(seo_object)
        find_pattern(seo_object.class, DefaultPatternName)
    end

    def self.find_pattern(seo_object_class, pattern_name)
        SeoPattern.find_by_table_name_and_name(seo_object_class.to_s.tableize, pattern_name)
    end
end
