module CommonSelect
    def all_for_select(options = {})
        options[:field] ||= [:name]
        options[:field] = options[:field].is_a?(Array) ? options[:field] : [options[:field]]
        options[:order] ||= options[:field]
        options[:order] = options[:order].is_a?(Array) ? options[:order].join(',') : options[:order]
        options[:conditions] ||= {}
        options[:method_options] = {:conditions => options[:conditions]}
        options[:method_options].merge!({:order => options[:order]})
        self.all(options[:method_options]).collect do |object|
            values = options[:field].collect {|field| object.send(field)}
            [values.join(","), object.id]
        end
    end
end
