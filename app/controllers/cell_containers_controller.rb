class CellContainersController < ResourceController::Base
    [create, update, destroy].each do |action|
        action.wants.html { redirect_to collection_path }
    end

    new_action.before do
        @available_cells = CellRegistry.registry
    end
    edit.before do
        @available_cells = CellRegistry.registry
    end
end
