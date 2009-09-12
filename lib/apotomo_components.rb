module ApotomoComponents
    def render_apotomo_component(apotomo_component, options = {})
        klass = (apotomo_component.to_s + "_cell").classify.constantize
        composition_rules = klass::CompositionRules
#        if composition_rules.has_key? :required_options
#            for required_option in composition_rules[:required_options] do
#                if not options.keys.include? required_option
#                    raise "not enough options: [#{required_option.to_s}] is needed"
#                end
#            end
#        end
        root_container_id = composition_rules[:root_container_id]
        use_widgets do |root|
            root << cell_container = cell(apotomo_component, :root_container, root_container_id)
            compose_widget_tree(apotomo_component, cell_container, composition_rules[:widget_tree])
            for event_handler in composition_rules[:event_handlers] do
                cell_container.watch(event_handler[:event], event_handler[:target_cell_id], event_handler[:invoked_state], nil)
            end
        end
        rendered_output = render_widget(root_container_id) do |root_cell|
            debugger
            options.each do |key, value|
                root_cell.send(key.to_s + "=", value) 
            end
        end
        return rendered_output
    end

    def compose_widget_tree(apotomo_component, cell_container, children)
        for child in children do
            cell_container << cell(apotomo_component, child[:method], child[:id])
            if child.has_key? :children
                compose_widget_tree(apotomo_component, cell_container, child[:children])
            end
        end
    end
end
