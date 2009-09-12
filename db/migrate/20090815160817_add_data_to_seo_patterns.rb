class AddDataToSeoPatterns < ActiveRecord::Migration
    class SeoPattern < ActiveRecord::Base
    end

    TableNames = {
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

    TableAttributes = %w(url title keywords description tags)

    def self.up
        SeoPattern.destroy_all
        TableNames.each do |table_name, fields|
            basic_pattern = fields.collect {|field| "___#{field}___"}.join(", ")
            seo_pattern = SeoPattern.create! :table_name => table_name.to_s
            for attribute in TableAttributes do
                seo_pattern.update_attribute attribute, basic_pattern
            end
            seo_pattern.update_attribute :name, "DEFAULT_PATTERN"
        end
    end

    def self.down
        SeoPattern.destroy_all
    end
end
