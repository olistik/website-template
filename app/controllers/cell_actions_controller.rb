class CellActionsController < ResourceController::Base
    [create, update, destroy].each do |action|
        action.wants.html { redirect_to collection_path }
    end

    def update_cell_actions(cell_container_id = params[:cell_container_id])
        @cell_actions = CellRegistry::actions_by_cell(CellContainer.find(cell_container_id).name)
        render :layout => false
    end
end
