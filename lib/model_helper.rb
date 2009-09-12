module ModelHelper
    def value_for(field_name)
        if self.respond_to? "value_for_" + field_name.to_s
            return self.send("value_for_" + field_name.to_s)
        end
        unless self.respond_to? field_name.to_s
            raise "#{self.class} should declare [value_for_]#{field_name}"
        end
        index = self.class.columns.index do |column|
            column.name == field_name.to_s
        end
        if index and [:string, :text].include? self.class.columns[index].type
            return ERB::Util::h((self.send(field_name.to_s)))
        end
        self.send(field_name.to_s)
    end
end
