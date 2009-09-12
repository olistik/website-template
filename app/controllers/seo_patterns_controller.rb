class SeoPatternsController < ResourceController::Base
    [create, update, destroy].each do |action|
        action.wants.html { redirect_to collection_path }
    end

    new_action.before do
        get_collections
    end

    edit.before do
        get_collections
    end

    def get_collections
        @table_names = SeoPattern.get_table_names
        @cell_layouts = CellLayout.all_for_select
    end

    def table_attributes(table_name = params[:table_name])
        @table_name = table_name
        render :layout => false
    end
end
