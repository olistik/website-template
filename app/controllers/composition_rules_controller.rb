class CompositionRulesController < ResourceController::Base
    [create, update, destroy].each do |action|
        action.wants.html { redirect_to collection_path }
    end

    new_action.before do
        load_relationship_collections
    end

    edit.before do
        load_relationship_collections
    end

    index.before do
        @paths = CompositionRule.paths
    end

    def load_relationship_collections
        @composition_rules = CompositionRule.all_for_select
        @cell_layouts = CellLayout.all_for_select
        @cell_actions = CellAction.all_extended_for_select
        @paths = CompositionRule.paths
    end

    def search
        @cell_layouts = CellLayout.all_for_select
        @current_cell_layout_id = CellLayout.find(params[:cell_layout_id]).id
        @composition_rules = CompositionRule.find_all_by_cell_layout_id @current_cell_layout_id
        render :action => :index
    end
end
