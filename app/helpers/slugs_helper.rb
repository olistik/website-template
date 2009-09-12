module SlugsHelper
    def generate_text_field_js_var(attribute_name)
        text_field = text_field_tag("slug[param_data][NEW_RECORD][#{attribute_name}]")
        text_field = escape_javascript(text_field)
        "var slug_param_#{attribute_name} = '#{text_field}';\n"
    end

    def generate_remove_link()
        link_to 'Rimuovi', 'javascript:void(0)', :class => 'remove slug_parameter'
    end

    def generate_remove_link_js_var()
        remove_link = generate_remove_link()
        remove_link = escape_javascript(remove_link)
        "var remove_link = '#{remove_link}';\n"
    end

    def generate_text_field_js_vars()
        [:name, :value].sum do |attribute_name|
            generate_text_field_js_var(attribute_name)
        end
    end

    def generate_js_vars()
        results = generate_text_field_js_vars()
        results += generate_remove_link_js_var()
    end
end
