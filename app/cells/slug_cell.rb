class SlugCell < Cell::Base
    def param_data
        @slug = @opts[:slug]
        nil
    end

    def seo_objects_by_type
        @seo_object_type = @opts[:seo_object_type]
        @seo_object_id = @opts[:seo_object_id]
        @seo_objects = @seo_object_type.classify.constantize.all_for_select       
        nil
    end

    def compose
        @slug = @opts[:slug]
        @cell_layout = @slug.seo_pattern.cell_layout
        @cell_actions = []
        @cell_actions << root_node = @cell_layout.composition_rules.first.root_node
        while root_node.next_node != nil
            @cell_actions << root_node = root_node.next_node
        end
        nil
    end

    def render_cell_action
        @cell_action = @opts[:cell_action]
        @cell_name = cell_action.cell_container.name.to_sym
        @cell_state = cell_action.name.to_sym
        @cell_options = {:slug => @slug}
        nil
    end

    def draw_path
        path_data = @opts[:path_data]
        @composition_rule = @opts[:composition_rule]
        @cell_layout = path_data[:cell_layout]
        @path = path_data[:path]
        nil
    end

    def draw_path_for_index
        path_data = @opts[:path_data]
        @cell_layout = path_data[:cell_layout]
        @path = path_data[:path]
        nil
    end
end
