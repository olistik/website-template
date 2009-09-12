class SeoPatternCell < Cell::Base
    def table_attributes
        @table_attributes = SeoPattern::List[@opts[:table_name].to_sym]
        nil
    end
end
