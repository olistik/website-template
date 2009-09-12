# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
    def menu_link(menu_entry)
        if menu_entry.cms_action.nil?
            cms_action_url = "javascript:void(0);"
        else
            cms_action_url = url_for(
                :action => menu_entry.cms_action.name,
                :controller => menu_entry.cms_action.cms_controller.name
            )
        end
        return link_to(menu_entry.name, cms_action_url)
    end

    # TODO add check for current entry and highlight the corresponding html element
    # TODO add check for authorized menus, need to pass current_user too
    def print_recursive_menu(menu_entry)
        menu_children = MenuEntry.find_all_by_parent_id(menu_entry.id)
        current_entry = "<li>" + menu_link(menu_entry) + "</li>"
        return current_entry if menu_children.size == 0
        current_entry = "<li>" + menu_link(menu_entry) + "<ul>"
        for menu_child in menu_children do
            current_entry += print_recursive_menu(menu_child)
        end
        current_entry += "</ul></li>"
        return current_entry
    end

    def generate_html(form_builder, method, options = {})
        options[:object] ||= form_builder.object.class.reflect_on_association(method).klass.new
        form_builder.fields_for(method, options[:object], :child_index => 'NEW_RECORD') do |f|
            options[:locals] ||= {options[:form_builder_local] => f}
            render(:partial => options[:partial], :locals => options[:locals])
        end
    end

    def generate_html_existing_records(form_builder, method, options = {})
        options[:dest_objects] ||= method.to_s.pluralize.to_sym
        options[:objects_query_method] ||= :all
        options[:objects] ||= method.to_s.singularize.camelize.constantize.send(options[:objects_query_method])
        options[:locals] ||= {}
        options[:locals].merge!({options[:form_builder_local] => form_builder})
        options[:locals].merge!({options[:dest_objects] => options[:objects]})
        render(:partial => options[:partial], :locals => options[:locals])
    end

    def generate_template(form_builder, method, options = {})
        options[:partial] ||= method.to_s.singularize
        options[:form_builder_local] ||= :f
        options[:existing_records] ||= false
        if options[:existing_records]
            template = generate_html_existing_records(form_builder, method, options)
        else
            template = generate_html(form_builder, method, options)
        end
        escape_javascript(template)
    end

    def generate_template_var(form_builder, method, options = {})
        template = generate_template(form_builder, method, options)
        "var #{method.to_s.singularize} = '#{template}'"
    end

    def observe_select(source, options = {})
        render :partial => "shared/observe_select", :locals => {
            :source => source,
            :url => options[:url],
            :param_name => options[:param_name],
            :update => options[:update]
        }
    end

end

